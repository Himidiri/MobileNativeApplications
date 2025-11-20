//
//  JSONUserDefaultExample.swift
//  Week4
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct JSONUserDefaultExample: View {
    @EnvironmentObject var viewModel: TodoViewModel
    @State private var newTitle: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add Todo") {
                    HStack {
                        TextField("New todo", text: $newTitle)
                        Button("Add") { viewModel.addTodo(title: newTitle); newTitle = "" }
                            .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                }
                
                Section {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Button {
                                viewModel.toggle(todo)
                            } label: {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            }
                            .buttonStyle(.borderless)
                            
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                                .foregroundStyle(todo.isCompleted ? .secondary : .primary)
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                }
                
                
            }
            .navigationTitle("JSON + UserDefaults").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    JSONUserDefaultExample()
        .environmentObject(TodoViewModel())
}
