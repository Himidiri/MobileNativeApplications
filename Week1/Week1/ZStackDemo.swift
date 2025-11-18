//
//  ZStackDemo.swift
//  Week1
//
//  Created by Himidiri Himakanika on 2025-11-18.
//
import SwiftUI

struct ZStackDemo: View {
    var body: some View {
        ZStack {
            Rectangle().fill(.blue).ignoresSafeArea()
            
            Image(systemName: "star")
                .font(.system(size: 100))
                .foregroundColor(.yellow)
            
            Image(systemName: "circle")
                .font(.system(size: 200))
                .foregroundColor(.green)
        }
    }
}

#Preview {
    ZStackDemo()
}
