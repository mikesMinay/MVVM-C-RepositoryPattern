//
//  EnumeratedForEach.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/27/23.
//

import SwiftUI

struct EnumeratedForEach<T, Content: View>: View {
    let data: [T]
    let content: (Int, T) -> Content
    
    init(_ data: [T], @ViewBuilder content: @escaping (Int, T) -> Content) {
        self.data = data
        self.content = content
    }
    
    var body: some View {
        ForEach(Array(self.data.enumerated()), id: \.offset) { index, item in
            self.content(index, item)
        }
    }
}
