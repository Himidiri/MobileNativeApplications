//
//  BookViewModel.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation
import Combine
import SwiftData

class BookViewModel: ObservableObject {
    private var context: ModelContext?
    @Published var books: [Book] = []
    
    func setContext(_ context: ModelContext) {
        self.context = context
    }
    
    func loadBooks() {
        guard let context else { return }
        let descriptor = FetchDescriptor<Book>(sortBy: [SortDescriptor(\.title)])
        do {
            let results = try context.fetch(descriptor)
            self.books = results
        } catch {
            
        }
    }
    
    func addNewBook(title: String, author: String, desc:String) {
        let newBook = Book(id: UUID(), title: title, author: author, desc: desc)
        if let context {
            context.insert(newBook)
            do { try context.save() } catch { }
            loadBooks()
        } else {
            books.append(newBook)
        }
    }
    
    func deleteBook(at index: Int) {
        if let context {
            guard books.indices.contains(index) else { return }
            let book = books[index]
            context.delete(book)
            do { try context.save() } catch { }
            loadBooks()
        } else {
            books.remove(at: index)
        }
    }
    
    func updateBook(at index: Int, title: String, author: String, desc: String) {
        guard books.indices.contains(index) else { return }
        let book = books[index]
        book.title = title
        book.author = author
        book.desc = desc
        if let context {
            do { try context.save() } catch { }
            loadBooks()
        }
    }
}

