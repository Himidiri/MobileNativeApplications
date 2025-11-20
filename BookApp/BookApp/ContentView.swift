//
//  ContentView.swift
//  BookApp
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @EnvironmentObject private var viewModel: BookViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                HStack (spacing: 20){
                    Text("Book App").font(Font.largeTitle).bold()
                    Spacer()
                    Button{
                        isPresented = true
                    }label: {
                        Image(systemName: "plus").foregroundStyle(.white).bold()
                    }
                }.padding(20)
                
                List {
                    ForEach(Array(viewModel.books.enumerated()), id: \.element.id) { index, book in
                        NavigationLink(destination: BookDetailView(viewModel: viewModel, index: index)) {
                            VStack(alignment: .leading) {
                                Text(book.title).font(.headline)
                                Text(book.author).font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for offset in indexSet {
                            viewModel.deleteBook(at: offset)
                        }
                    }
                }
            }.sheet(isPresented: $isPresented) {
                AddBookView(isPresented: $isPresented)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(BookViewModel())
}
