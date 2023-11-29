//
//  HomeView.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Home")
        Button {
            viewModel.logout()
        } label: {
            Text("Logout")
        }
    }
}

#Preview {
    HomeView(viewModel: .init(coordinator: AuthenticatedCoordinator()))
}
