//
//  HStackDemo.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//

import SwiftUI

struct HStackDemo: View {
    var body: some View {
        HStack (spacing: 10) {
            Rectangle().fill(.blue).frame(width: 70, height: 70)
            Rectangle().fill(.yellow).frame(width: 70, height: 70)
            Rectangle().fill(.red).frame(width: 70, height: 70)
            Rectangle().fill(.green).frame(width: 70, height: 70)
        }
        .padding()
        .border(.black, width: 2)
    }
}

#Preview {
    HStackDemo()
}
