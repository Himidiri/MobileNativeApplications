//
//  AddBookView.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var viewModel: BookViewModel
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var desc: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Title", text: $title)
                if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("Title can't be empty").foregroundColor(.red)
                }
                
                TextField("Author", text: $author)
                if author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("Author can't be empty").foregroundColor(.red)
                }
                
                TextField("Description", text: $desc)
                if desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("Description can't be empty").foregroundColor(.red)
                }
                
                Button("Add Book") {
                    viewModel.addNewBook(title: title, author: author, desc: desc)
                    isPresented = false
                    dismiss()
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                          author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                          desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    AddBookView(viewModel: BookViewModel(), isPresented: .constant(true))
}
