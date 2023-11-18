//
//  SearchView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 17.11.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField("Search plant...", text: $searchText)
        }
        .frame(maxWidth: 350)
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}

#Preview {
    SearchView()
}
