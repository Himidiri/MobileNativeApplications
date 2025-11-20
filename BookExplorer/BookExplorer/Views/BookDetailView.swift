//
//  BookDetailsView.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct BookDetailsView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                ForEach(book.authors) { author in
                    Text(author.name)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Summary")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    ForEach(book.summaries, id: \.self) { line in
                        Text(line)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BookDetailsView(book: Book.sample)
}
