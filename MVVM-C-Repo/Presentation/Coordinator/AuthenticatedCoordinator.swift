//
//  AuthenticatedCoordinator.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import SwiftUI
import Stinsen

final class AuthenticatedCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AuthenticatedCoordinator.start)
    @Root var start = makeStart
    @Root var unauthenticated = makeUnauthenticated
    
    @ViewBuilder
    func makeStart() -> some View {
        makeHome()
    }
    
    func routeToUnauthenticated() {
        self.root(\.unauthenticated)
    }
}

private extension AuthenticatedCoordinator {
    @ViewBuilder
    func makeHome() -> HomeView {
        HomeView(viewModel: .init(coordinator: self))
    }
    
    @ViewBuilder
    func makeUnauthenticated() -> some View {
        UnauthenticatedCoordinator().view()
    }
}
