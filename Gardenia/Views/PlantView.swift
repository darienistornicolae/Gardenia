//
//  PlantView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 08.11.2023.
//

import SwiftUI

struct PlantView: View {
    
    let plant: Datum
    
    @StateObject var viewModel = PlantViewModel()
    var body: some View {
        NavigationView {
           
            VStack {
                if let image = viewModel.plantImage[plant.id] {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        
                } else {
                    ProgressView()
                }
                cardView
                Spacer()
            }
            
        }
        .navigationTitle(plant.commonName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadImages(for: [plant])
        }
    }
    
}
#Preview {
    PlantView(plant: Datum(id: 1, commonName: "Rose", scientificName: ["Black Rose"], otherName: ["Bleah, Crazi"], cycle: Cycle.herbaceousPerennial, watering: Watering.average))
}

fileprivate extension PlantView {
    var cardView: some View {
        HStack {
            VStack {
                
                Text("Common Name: \(plant.commonName)")
                Text("Other Name: \(plant.otherName.first ?? "No other name")")
                Text("Scientific Name: \(plant.scientificName.first ?? "No other name")")
            }
            .multilineTextAlignment(.leading)
            .padding(5)
        }
        .padding(.all, 8) // Add padding to the HStack
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)
    }
    
    var watering: some View {
        VStack{
            
        }
    }
}
