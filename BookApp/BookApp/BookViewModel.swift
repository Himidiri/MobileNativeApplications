//
//  BookViewModel.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation
import Combine

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []
    
    func loadBooks() { }
    
    func addNewBook(title: String, author: String, desc:String) {
        let newBook = Book(id: UUID(), title: title, author: author, desc: desc)
        books.append(newBook)
    }
    
    func deleteBook(at index: Int) {
        guard books.indices.contains(index) else { return }
        books.remove(at: index)
    }
    
    func updateBook(at index: Int, title: String, author: String, desc: String) {
        guard books.indices.contains(index) else { return }
        let book = books[index]
        book.title = title
        book.author = author
        book.desc = desc
    }
}
