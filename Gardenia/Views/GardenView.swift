//
//  GardenView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 27.10.2023.
//

import SwiftUI

class GardenViewModel: ObservableObject {
    @Published var images: [Int: UIImage] = [:]
    
     func loadImages(for plants: [Datum]) {
        for plant in plants {
            Task {
                guard let imageURL = plant.defaultImage?.regularURL, let url = URL(string: imageURL) else { return }
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.images[plant.id] = image
                    }
                }
            }
        }
    }
}

struct GardenView: View {
    let garden: Garden
    @StateObject var viewModel = GardenViewModel()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            
            List(garden.plants.data, id: \.id) { plant in
                NavigationLink {
                    
                    PlantView(plant: Datum(id: plant.id, commonName: plant.commonName, scientificName: plant.scientificName, otherName: plant.otherName, cycle: plant.cycle, watering: plant.watering))
                } label: {
                    HStack {
                        if let image = viewModel.images[plant.id] {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .frame(width: 110, height: 110)
                        } else {
                            ProgressView()
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
