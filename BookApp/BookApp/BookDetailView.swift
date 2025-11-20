//
//  BookDetailView.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct BookDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: BookViewModel
    let index: Int
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var desc: String = ""
    
    var body: some View {
        Form {
            
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Text("Title can't be empty").foregroundColor(.red)
            }
            
            TextField("Author", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Text("Author can't be empty").foregroundColor(.red)
            }
            
            TextField("Description", text: $desc)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Text("Description can't be empty").foregroundColor(.red)
            }
            
            Button("Update") {
                viewModel.updateBook(at: index, title: title, author: author, desc: desc)
                dismiss()
            }
            .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                      author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                      desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            guard index < viewModel.books.count else { return }
            let book = viewModel.books[index]
            self.title = book.title
            self.author = book.author
            self.desc = book.desc
        }
    }
}

#Preview {
    let vm = BookViewModel()
    vm.addNewBook(title: "Sample Title", author: "Sample Author", desc: "Sample Description")
    return NavigationView { BookDetailView(viewModel: vm, index: 0) }
}
