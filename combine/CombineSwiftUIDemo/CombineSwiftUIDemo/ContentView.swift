//
//  ContentView.swift
//  CombineSwiftUIDemo
//
//  Created by Emil Atanasov on 26.01.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TodoViewModel()
    
    var body: some View {
        if let todo = viewModel.todo {
            Text(todo.title)
            .padding()
        } else {
            Text("Loading ...")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
