//
//  Context.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/29/23.
//

import Foundation

protocol ContextImpl: ObservableObject {
    var isLoggedin: Bool { set get }
}

final class Context: ContextImpl {
    static let shared: Context = {
        return .init()
    }()
    
    @Published var isLoggedin: Bool = false
}
