//
//  Book.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation

struct BookResponse: Decodable {
    let results: [Book]
}

struct Book : Identifiable, Decodable {
    let id : Int
    let title: String
    let authors: [Author]
    let summaries: [String]
    let downloadCount : Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case authors
        case summaries
        case downloadCount = "download_count"
    }
}

struct Author: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let birthYear: Int
    let deathYear: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case deathYear = "death_year"
    }
}

extension Book {
    static var sample: Book {
        Book(id: 1, title: "Sample Book", authors: [Author(name: "Sample Author", birthYear: 1980, deathYear: nil)], summaries: ["Sample Summary, Line 1", "Sample Summary, Line 2"], downloadCount: 100)
    }
}
