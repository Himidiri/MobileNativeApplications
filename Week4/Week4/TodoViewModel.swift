//
//  TodoViewModel.swift
//  Week4
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation
import Combine

final class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = [] {
        didSet { save(todos) }
    }
    
    private let key = "myTodos"
    
    
    init() {
        self.todos = load()
    }
    
    // MARK: - Public API
    func addTodo(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        let todo = TodoItem(title: trimmed)
        todos.append(todo)
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets.sorted(by: >) {
            todos.remove(at: index)
        }
    }
    
    func toggle(_ todo: TodoItem) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[index].isCompleted.toggle()
    }
    
    // MARK: - Persistence
    private func load() -> [TodoItem] {
        let defaults = UserDefaults.standard
        guard let data = defaults.data(forKey: key) else {
            return []
        }
        let decoder = JSONDecoder()
        do {
            let todos = try decoder.decode([TodoItem].self, from: data)
            return todos
        } catch {
            print("❌ Failed to decode todos:", error)
            return []
        }
    }
    
    private func save(_ todos: [TodoItem]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(todos)
            let defaults = UserDefaults.standard
            defaults.set(data, forKey: key)
        } catch {
            print("❌ Failed to encode todos:", error)
        }
    }
}
