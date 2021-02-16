//
//  ContentView.swift
//  Todo App
//
//  Created by SLYTH on 15/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddTodoView: Bool = false
    var body: some View {
        NavigationView{
            List(0..<5){ item in
                Text("Hello, world!")
            }
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddTodoView.toggle()
                                }){
                                    Image(systemName: "plus")
                                }
                                .sheet(isPresented: $showingAddTodoView){
                                    AddTodoView()
                                }
                                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
