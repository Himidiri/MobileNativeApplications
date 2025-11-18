//
//  ButtonView 2.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//


//
//  ButtonView.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//

import SwiftUI

struct ButtonView: View {
    @State private var name: String = ""
    @State private var greeting: String = ""
    
    var body: some View {
        VStack {
            if !greeting.isEmpty {
                Text("Hello, \(greeting)")
            }
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Greet!") {
                greeting = name
            }.padding(.horizontal,10).padding(.vertical,5).background(.green).foregroundColor(.white).cornerRadius(8)
        }
    }
}

#Preview {
    ButtonView()
}
