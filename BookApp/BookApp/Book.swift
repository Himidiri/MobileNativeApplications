//
//  Book.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import Foundation
import SwiftData

@Model
class Book: Identifiable, Hashable {
    @Attribute(.unique) var id : UUID
    var title: String
    var author: String
    var desc: String
    
    init(id: UUID, title: String, author: String, desc: String) {
        self.id = id
        self.title = title
        self.author = author
        self.desc = desc
    }
}
