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
                
                gardenList
                
            }
        .navigationTitle(garden.gardenName)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    SearchPlantView(viewModel: AddPlantOnboardingViewModel())
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

#Preview {
    GardenView(garden: Garden(gardenId: "dasdsa", gardenName: "My awsome garden", plants: PlantsModel(data: [Datum](), total: 12)))
}

fileprivate extension GardenView {
    
    var gardenList: some View {
        
        List(garden.plants.data, id: \.id) { plant in
            NavigationLink {
                
                PlantView(plant: PlantDetailsModel(id: plant.id, commonName: plant.commonName, scientificName: plant.scientificName, otherName: plant.otherName, dimension: "", dimensions: Dimensions(), cycle: plant.cycle.rawValue, sunlight: [plant.sunlight], watering: plant.watering.rawValue, description: "", otherImages: ""))
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
                
                .cornerRadius(10)
                .shadow(color: colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)
            }
            
        }
        
    }
}
