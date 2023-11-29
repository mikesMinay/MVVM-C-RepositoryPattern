//
//  UserDataSource.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import Foundation

protocol UserDataSourceImpl {
    func getUserInfo() async -> UserDTO
}

final class UserDataSource: UserDataSourceImpl {
    func getUserInfo() async -> UserDTO {
        return .init(userName: "Admin")
    }
}
