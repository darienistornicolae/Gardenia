//
//  GardenView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 27.10.2023.
//

import SwiftUI

struct GardenView: View {
    let garden: Garden
    var body: some View {
        List(garden.plants.data, id: \.id) { plant in
            Text(plant.commonName)
        }
        .navigationTitle(garden.gardenName)
    }
}

//#Preview {
//    GardenView()
//}
