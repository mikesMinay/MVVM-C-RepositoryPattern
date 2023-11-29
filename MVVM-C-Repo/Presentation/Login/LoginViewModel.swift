//
//  LoginViewModel.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import Foundation
import Stinsen

final class LoginViewModel: BaseViewModel {
    
    @Published private(set) var state: DataState<UserEntities> = .initialized
    @Published var username: String = ""
    
    private let coordinator: UnauthenticatedCoordinator
    private let getUserInfoUseCase: GetUserInfoUseCaseImpl
    private let context: any ContextImpl
    
    enum LoginErro: Error {
        case somethingWntWrong
        case unableToLogin
    }
    
    init(
        coordinator: UnauthenticatedCoordinator,
        getUserInfoUseCase: GetUserInfoUseCaseImpl,
        context: any ContextImpl
    ) {
        self.coordinator = coordinator
        self.getUserInfoUseCase = getUserInfoUseCase
        self.context = context
    }
    
    @MainActor func login() async {
        do {
            state = .loading
            
            let info = try await getUserInfoUseCase.execute(username)
            
            if info.isLoggedin {
                state = .success(info)
                context.isLoggedin = true
                coordinator.routeToAuthenticated()
            } else {
                state = .failed(LoginErro.unableToLogin)
            }
        } catch {
            state = .failed(LoginErro.somethingWntWrong)
        }
    }
    
    @MainActor func registration() async {
        coordinator.routeToRegistration()
    }
    
    var showContent: Bool {
        state != .loading
    }
}

extension LoginViewModel {
    convenience init(coordinator: UnauthenticatedCoordinator, getUserInfoUseCase: GetUserInfoUseCaseImpl) {
        self.init(
            coordinator: coordinator, 
            getUserInfoUseCase: getUserInfoUseCase,
            context: Context.shared
        )
    }
}
