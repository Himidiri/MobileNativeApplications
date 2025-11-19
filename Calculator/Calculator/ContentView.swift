//
//  ContentView.swift
//  Calculator
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitPrice : String = ""
    @State private var quantity : String = ""
    @State private var totalPrice : String = ""
    @State private var errorMsg : String?
    @State private var hasCalculated: Bool = false
    
    var body: some View {
        VStack {
            Text("Calculator").font(.largeTitle).bold()
            Image(systemName: "function")
                .font(.title)
                .foregroundStyle(.red)
            
            LabeledContent {
                TextField("Enter Unit Price", text: $unitPrice)
                    .textFieldStyle(.roundedBorder)
                    .border(.black)
                    .padding(.vertical, 20)
                    .onChange(of: unitPrice) {
                        hasCalculated = false
                        errorMsg = nil
                    }
            } label: {
                Text("Unit Price $ :").bold()
            }
            .padding(.horizontal, 50)
            
            LabeledContent {
                TextField("Enter Quantity", text: $quantity)
                    .textFieldStyle(.roundedBorder)
                    .border(.black)
                    .onChange(of: quantity) {
                        hasCalculated = false
                        errorMsg = nil
                    }
            } label: {
                Text("      Quantity :").bold()
            }
            .padding(.horizontal, 50)
            
            Button("Calculate") {
                if let unitPriceValue = Double(unitPrice), let quantityValue = Double(quantity) {
                    let total = unitPriceValue * quantityValue
                    totalPrice = String(format: "%.2f", total)
                    errorMsg = nil
                    hasCalculated = true
                } else {
                    totalPrice = ""
                    errorMsg = "Invalid input."
                    hasCalculated = false
                }
            }.disabled(unitPrice.isEmpty || quantity.isEmpty).buttonStyle(.borderedProminent).padding()
            
            if let errorMsg {
                Text(errorMsg)
                    .foregroundStyle(.red)
            }
            
            if hasCalculated && errorMsg == nil && !totalPrice.isEmpty {
                Grid(horizontalSpacing: 24, verticalSpacing: 12) {
                    GridRow {
                        Text("Quantity").bold()
                        Text("Unit Price").bold()
                        Text("Total").bold()
                    }
                    .padding(.vertical, 4)
                    
                    GridRow {
                        Text(quantity)
                        Text(unitPrice)
                        Text(totalPrice)
                    }
                    .padding(.vertical, 4)
                }
                .padding(.top, 12)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
