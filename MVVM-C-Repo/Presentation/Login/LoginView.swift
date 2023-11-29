//
//  LoginView.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/28/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    enum Constant {
        static let spacing: CGFloat = 12
        static let padding: CGFloat = 12
        static let mainPadding: CGFloat = 20
        static let textFieldHeight: CGFloat = 40
    }
    
    var body: some View {
        mainContent
    }
}

private extension LoginView {
    var mainContent: some View {
        VStack(spacing: Constant.spacing) {
            headerContent
                .padding(.top, Constant.padding)
            if viewModel.showContent {
                bodyContent
                    .padding([.bottom, .horizontal], Constant.padding)
            }
        }
        .background {
            Color.black
        }
        .padding(.horizontal, Constant.mainPadding)
    }
    
    var headerContent: some View {
        LoadingView(
            source: viewModel,
            placeholder: LoadingIndicator(style: .large)
        ) { error in
            Text("Error Unable to login")
                .foregroundStyle(.white)
        } content: { item in
            Text("\(item.username) is loggedin :\(String(item.isLoggedin))")
                .foregroundStyle(.white)
        }
    }
    
    @ViewBuilder
    var bodyContent: some View {
        TextField("", text: $viewModel.username, prompt: textFieldPlaceHolder)
            .frame(height: Constant.textFieldHeight)
            .foregroundStyle(Color.white)
            .border(textFieldBorderColor)
        Button {
            Task { await viewModel.login() }
        } label: {
            Text("Login")
        }
        
        Button {
            Task { await viewModel.registration() }
        } label: {
            Text("Registration")
        }
    }
    
    var textFieldPlaceHolder: Text {
        Text(" Username").foregroundStyle(Color.white)
    }
    
    var textFieldBorderColor: Color { .white }
}

#Preview {
    LoginView(
        viewModel: .init(
            coordinator: UnauthenticatedCoordinator(), 
            getUserInfoUseCase: GetUserInfoUseCase(
                repository: UserDataRepository(dataSource: UserDataSource())
            )
        )
    )
}
