//
//  TodoItem.swift
//  Week4
//
//  Created by Himidiri Himakanika on 2025-11-20.
//
import Foundation

struct TodoItem: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    var title: String
    var isCompleted: Bool = false

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
