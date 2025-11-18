//
//  ListExampleView.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//

import SwiftUI

struct ListExampleView: View {
    
    @State private var names = ["Kaet","Kanon","Maris","Yuki"]
    @State private var name: String = ""
    
    var body: some View {
        VStack{
            HStack{
                TextField("Enter a name", text: $name).textFieldStyle(.roundedBorder)
                Button("Add"){
                    self.names.append(self.name)
                    self.name = ""
                }.disabled(self.name.isEmpty).padding(.horizontal, 10).padding(.vertical,6).background(Color.green).cornerRadius(8).foregroundColor(.white)
            }.padding(20)
            
            List(self.names, id: \.self){ name in
                Text(name)
            }.navigationBarTitle("List")
            
//            List(self.names, id: \.self){
//                Text($0)
//            }.navigationBarTitle("List")
        }
    }
}

#Preview {
    ListExampleView()
}
