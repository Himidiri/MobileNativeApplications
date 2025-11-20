//
//  BookListView.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct BookRowView: View {
    
    let book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(book.title)
                .font(.headline)
                .lineLimit(2)

            Text(book.authors.map(\.name).joined(separator: ", "))

            HStack {
                Image(systemName: "arrow.down.circle")
                Text("\(book.downloadCount)")
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    BookRowView(book: Book.sample)
}