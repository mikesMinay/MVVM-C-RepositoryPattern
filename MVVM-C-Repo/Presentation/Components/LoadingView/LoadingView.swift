//
//  LoadingView.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/27/23.
//

import SwiftUI

struct LoadingView<Source: BaseViewModel, Placeholder, ErrorPlaceHolder, Content>: View where Placeholder: View, ErrorPlaceHolder: View, Content: View {
    
    @ObservedObject private var source: Source
    private var placeholder: Placeholder
    private var errorPlaceHolder: (Error) -> ErrorPlaceHolder
    private var content: (Source.A) -> Content
    
    init(
        source: Source,
        placeholder: Placeholder,
        errorPlaceHolder: @escaping (Error) -> ErrorPlaceHolder,
        @ViewBuilder content: @escaping (Source.A) -> Content
    ) {
        self.source = source
        self.placeholder = placeholder
        self.errorPlaceHolder = errorPlaceHolder
        self.content = content
    }
    
    var body: some View {
        mainContent
    }
}

private extension LoadingView {
    var mainContent: some View {
        Group {
            switch source.state {
            case .initialized:
                Text("")
            case .loading:
                placeholder
            case .failed(let error):
                self.errorPlaceHolder(error)
            case .success(let data):
                content(data)
            case .data:
                Text("Data")
            }
        }
    }
}

extension LoadingView where ErrorPlaceHolder == EmptyView {
    init(
        source: Source,
        placeholder: Placeholder,
        @ViewBuilder content: @escaping (Source.A) -> Content
    ) {
        self.source = source
        self.placeholder = placeholder
        self.errorPlaceHolder = { _ in EmptyView() }
        self.content = content
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(
            source: TestViewModel(
                state: .success([""])
            ),
            placeholder: LoadingIndicator(style: .large),
            errorPlaceHolder: { error in
            Text("Error")
        }, content: { items in
            EnumeratedForEach(items) { _, item in
                Text("\(item)")
            }
        })
    }
}

fileprivate final class TestViewModel: BaseViewModel {
    var state: DataState<[String]>
    init(state: DataState<[String]>) {
        self.state = state
    }
    func load() {}
}
