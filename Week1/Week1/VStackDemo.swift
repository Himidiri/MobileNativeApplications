//
//  VStackDemo.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//

import SwiftUI

struct VStackDemo: View {
    var body: some View {
        VStack (spacing: 20) {
            Rectangle().fill(.blue).frame(height:50)
            Rectangle().fill(.yellow).frame(height:50)
            Rectangle().fill(.red).frame(height:50)
            Rectangle().fill(.green).frame(height:50)
        }
        .padding()
        .border(.black, width: 2)
    }
}

#Preview {
    VStackDemo()
}
