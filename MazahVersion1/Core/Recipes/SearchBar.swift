//
//  SearchBar.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/4/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(.vertical, 10)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 16)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 16)
            }
        }
    }
}

