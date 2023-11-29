//
//  UnauthenticatedCoordinator.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import SwiftUI
import Stinsen

final class UnauthenticatedCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \UnauthenticatedCoordinator.start)
    
    @Root var start = makeStart
    @Root var authenticated = makeAuthenticated
    @Route(.modal) var registration = makeRegistration
    
    private let repository = UserDataRepository(dataSource: UserDataSource())
    private var userInfoUseCase: GetUserInfoUseCaseImpl { GetUserInfoUseCase(repository: repository) }
    
    func routeToAuthenticated() {
        self.root(\.authenticated)
    }
    
    func routeToRegistration() {
        self.route(to: \.registration)
    }
}

private extension UnauthenticatedCoordinator {
    @ViewBuilder
    func makeStart() -> some View {
        makeLogin()
    }
    
    @ViewBuilder
    func makeLogin() -> LoginView {
        LoginView(
            viewModel: .init(coordinator: self, getUserInfoUseCase: userInfoUseCase)
        )
    }
    
    @ViewBuilder
    func makeRegistration() -> some View {
        RegistrationView(viewModel: .init(coordinator: self))
    }
    
    func makeAuthenticated() -> AuthenticatedCoordinator {
        return AuthenticatedCoordinator()
    }
}
