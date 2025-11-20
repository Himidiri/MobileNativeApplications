//
//  AddBookView.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct AddBookView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var viewModel: BookViewModel
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var desc: String = ""
    @State private var didAttemptSubmit: Bool = false
    @Environment(\.dismiss) var dismiss
    
    private var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Title", text: $title)
                if didAttemptSubmit && title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("Title can't be empty").foregroundColor(.red)
                }
                
                TextField("Author", text: $author)
                if didAttemptSubmit && author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("Author can't be empty").foregroundColor(.red)
                }
                
                TextField("Description", text: $desc)
                if didAttemptSubmit && desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("Description can't be empty").foregroundColor(.red)
                }
                
                Button("Add Book") {
                    didAttemptSubmit = true
                    guard isFormValid else { return }
                    viewModel.addNewBook(title: title, author: author, desc: desc)
                    isPresented = false
                    dismiss()
                }
                .disabled(!isFormValid)
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    AddBookView(isPresented: .constant(true))
        .environmentObject(BookViewModel())
}
