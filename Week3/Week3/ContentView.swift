//
//  ContentView.swift
//  Week3
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos: [Todo] = []
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 10) {
                List {
                    ForEach($todos) { $todo in
                        HStack {
                            Text(todo.description)
                                .strikethrough(todo.done)
                            Spacer()
                            Image(systemName: todo.done ? "checkmark.square" : "square")
                                .foregroundStyle(todo.done ? .green : .secondary)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture { todo.done.toggle() }
                    }
                }
                
                InputTodoView(todos: $todos)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .navigationTitle("ToDo List")
        }
    }
}

#Preview {
    NavigationStack { ContentView() }
}
