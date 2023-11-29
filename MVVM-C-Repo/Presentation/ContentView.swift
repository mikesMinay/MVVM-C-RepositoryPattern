//
//  ContentView.swift
//  MVVM-C-Repo
//
//  Created by michael.san.minay on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MainCoordinator().view()
        }
    }
}

#Preview {
    ContentView()
}
