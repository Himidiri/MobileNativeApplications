//
//  ComboStackDemo.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//
import SwiftUI

struct ComboStackDemo: View {
    var body: some View {
        VStack (spacing:10) {
            Rectangle().fill(.blue).frame(height: 70)
            HStack (spacing:10){
                Rectangle().fill(.red).frame(width: 70,height: 70)
                Rectangle().fill(.yellow).frame(width: 70, height: 70)
            }
            Rectangle().fill(.green).frame(height: 70)
        }.padding().border(.black,width:2)
    }
}

#Preview {
    ComboStackDemo()
}
