//
//  KeyValueView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 18.11.2023.
//

import SwiftUI

struct KeyValueView: View {
    var key: String
    var value: String
    
    var body: some View {
        
        HStack {
            Text(key)
            Spacer()
            Text(value)
        }
    }
}


#Preview {
    KeyValueView(key: "Something", value: "Something")
}
