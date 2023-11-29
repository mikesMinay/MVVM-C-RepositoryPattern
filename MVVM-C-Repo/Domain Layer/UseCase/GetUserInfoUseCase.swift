//
//  GetUserInfoUseCase.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/29/23.
//

import Foundation

protocol GetUserInfoUseCaseImpl {
    func execute(_ username: String) async throws -> UserEntities
}

final class GetUserInfoUseCase: GetUserInfoUseCaseImpl {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(_ username: String) async throws -> UserEntities {
        try await repository.getUserInfo(with: username)
    }
}
