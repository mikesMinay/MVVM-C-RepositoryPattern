//
//  BaseViewModel.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/27/23.
//

import Foundation

enum DataState<A> {
    case initialized
    case loading
    case failed(Error)
    case success(A)
    case data
}

extension DataState: Equatable {
    static func == (lhs: DataState<A>, rhs: DataState<A>) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failed, .failed):
            return true
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
}

protocol BaseViewModel: ObservableObject {
    associatedtype A
    var state: DataState<A> { get }
    func load()
    func load() async
}

extension BaseViewModel {
    func load() {}
    func load() async {}
}
