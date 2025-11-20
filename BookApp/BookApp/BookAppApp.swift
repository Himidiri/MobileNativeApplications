//
//  BookAppApp.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import SwiftUI
import SwiftData

@main
struct BookAppApp: App {
    @StateObject private var viewModel = BookViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
        .modelContainer(for: Book.self)
    }
}
