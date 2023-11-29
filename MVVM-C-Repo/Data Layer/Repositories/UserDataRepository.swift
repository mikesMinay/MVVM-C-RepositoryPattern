//
//  UserDataRepository.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import Foundation

protocol UserRepository {
    func getUserInfo(with username: String) async throws -> UserEntities
}

final class UserDataRepository: UserRepository {
    
    private let dataSource: UserDataSourceImpl
    
    init(dataSource: UserDataSourceImpl) {
        self.dataSource = dataSource
    }
    
    func getUserInfo(with username: String) async throws -> UserEntities {
        let secondsDelay = 3
        let user = await dataSource.getUserInfo()
        try await Task.sleep(nanoseconds: UInt64(secondsDelay * 1_000_000_000))
        return .init(username: username, isLoggedin: user.userName == username)
    }
}
