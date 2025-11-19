//
//  ContentView.swift
//  Week2
//
//  Created by Himidiri Himakanika on 2025-11-18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var task:[String] = []
    @State private var newTask:String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add a New Task", text: $newTask).textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                    Spacer()
                    Button("Add") {
                        let trimmedText = self.newTask.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmedText.isEmpty else { return }
                        self.task.append(trimmedText)
                        self.newTask = ""
                    }.disabled(self.newTask.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty).buttonStyle(.borderedProminent)
                }
                    
                if self.task.isEmpty {
                    Text("You have No tasks").foregroundStyle(Color.secondary)
                }else{
                    List{
                        ForEach(self.task, id: \.self) { item in
                            Text(item)
                        }
                        
                        .onDelete{index in
                            self.task.remove(atOffsets: index)
                        }
                    }
                }
            }.navigationTitle("My To Do List")
        }
    }
}

#Preview {
    ContentView()
}
