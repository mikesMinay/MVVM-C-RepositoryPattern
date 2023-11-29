//
//  HomeViewModel.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import Foundation
import Stinsen

final class HomeViewModel: ObservableObject {
    private let coordinator: AuthenticatedCoordinator
    
    init(coordinator: AuthenticatedCoordinator) {
        self.coordinator = coordinator
    }
    
    func logout() {
        coordinator.routeToUnauthenticated()
    }
}
