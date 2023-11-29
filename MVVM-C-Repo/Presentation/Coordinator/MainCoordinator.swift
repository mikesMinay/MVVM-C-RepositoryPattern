//
//  MainCoordinator.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCoordinator.start)
    @Root var start = makeStart
    
    private let context: any ContextImpl = Context.shared
}

private extension MainCoordinator {
    @ViewBuilder
    func makeStart() -> some View {
        if context.isLoggedin {
            makeAuthenticated()
        } else {
            makeUnauthenticated()
        }
    }
    
    @ViewBuilder
    func makeUnauthenticated() -> some View {
        UnauthenticatedCoordinator().view()
    }
    
    @ViewBuilder
    func makeAuthenticated() -> some View {
        AuthenticatedCoordinator().view()
    }
}
