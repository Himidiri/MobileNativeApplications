//
//  Week4App.swift
//  Week4
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI
import SwiftData

@main
struct Week4App: App {
    @StateObject private var viewModel = TodoViewModel()
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //AppStorageExample()
            JSONUserDefaultExample().environmentObject(viewModel)
        }
    }
}
