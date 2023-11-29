//
//  RegistrationView.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        Text("Registration")
    }
}

#Preview {
    RegistrationView(viewModel: .init(coordinator: UnauthenticatedCoordinator()))
}
