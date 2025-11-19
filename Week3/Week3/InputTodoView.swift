//
//  InputTodoView.swift
//  Week3
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import SwiftUI

struct InputTodoView: View {
    @State private var newTodoDescription: String = ""
    @Binding var todos: [Todo]
    
    var body: some View {
        HStack(spacing: 12) {
            TextField("Add a new task", text: $newTodoDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                let trimmed = newTodoDescription.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmed.isEmpty else { return }
                todos.append(Todo(description: trimmed, done: false))
                newTodoDescription = ""
            } label: {
                Text("Add")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundStyle(.white)
                    .background(.green)
                    .cornerRadius(5)
            }
            .disabled(newTodoDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
    }
}
