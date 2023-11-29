//
//  RegistrationViewModel.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import Foundation
import Combine

final class RegistrationViewModel: ObservableObject {
    private let coordinator: UnauthenticatedCoordinator
    
    init(coordinator: UnauthenticatedCoordinator) {
        self.coordinator = coordinator
    }
}
