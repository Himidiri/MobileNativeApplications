//
//  TextFieldView.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//

import SwiftUI

struct TextFieldView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Text("Hello \(name)").font(Font.largeTitle).padding()
            TextField("Enter your name" , text: $name).frame(height: 50).border(.gray)
        }.padding(20)
    }
}

#Preview {
    TextFieldView()
}
