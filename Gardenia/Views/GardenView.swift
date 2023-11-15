//
//  GardenView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 27.10.2023.
//

import SwiftUI


struct GardenView: View {
    let garden: Garden
    @StateObject var viewModel = GardenViewModel()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            
            List(garden.plants.data, id: \.id) { plant in
                NavigationLink {
                    
                    PlantView(plant: Datum(id: plant.id, commonName: plant.commonName, scientificName: plant.scientificName, otherName: plant.otherName, cycle: plant.cycle, watering: plant.watering, sunlight: plant.sunlight))
                } label: {
                    HStack {
                        if let image = viewModel.images[plant.id] {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .frame(width: 110, height: 110)
                        } else {
                            Image("plant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .frame(width: 110, height: 110)
                        }
                        VStack(alignment: .leading) {
                            Text(plant.commonName)
                            Text(plant.otherName.first ?? "No other name")
                                .font(.footnote)
                        }
                    }
                    .onAppear {
                        viewModel.loadImages(for: [plant])
                    }
                    .padding(.all, 8) // Add padding to the HStack
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    //.shadow(color: Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)
                }
                
            }
            
        }
        .navigationTitle(garden.gardenName)
    }
}

#Preview {
    GardenView(garden: Garden(gardenId: "dasdsa", gardenName: "My awsome garden", plants: PlantsModel(data: [Datum](), total: 12)))
}
