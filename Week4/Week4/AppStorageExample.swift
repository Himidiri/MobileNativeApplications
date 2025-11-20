//
//  AppStorage.swift
//  Week4
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct AppStorageExample: View {

    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("username") private var username = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Profile") {
                    TextField("Username", text: $username)
                }
                
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                
                Section("Preview") {
                    HStack {
                        Text("Hello,")
                        Text(username.isEmpty ? "Guest" : username)
                            .fontWeight(.bold)
                    }
                    
                    Text("Dark mode is \(isDarkMode ? "ON" : "OFF")")
                        .foregroundStyle(isDarkMode ? .green : .red)
                }
            }
            .navigationTitle("Settings")
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}


#Preview {
    AppStorageExample()
}
