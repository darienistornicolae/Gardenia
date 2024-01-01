//
//  GardenCardView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 02.11.2023.
//

import SwiftUI

struct GardenCardView: View {
    var garden: Garden
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                Text(garden.gardenName)
                    .font(.headline)
                    .foregroundColor(Color.primary)
                
                HStack {
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.green)
                    Text("\(garden.plants.total) plants")
                        .font(.subheadline)
                        .foregroundColor(Color.secondary)
                    
                }
            }
            .padding(.leading, 8) 
            
            Spacer()
        }
        .padding(.all, 8)
        .cornerRadius(10)
        .shadow(color: colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    GardenCardView(garden: Garden(gardenId: "1", gardenName: "MY garden", plants: PlantsModel(data: [Datum](), total: 0)))
}
