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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            ScrollView {
                ZStack {
                    if colorScheme == .dark {
                        Color.darkModeColor.ignoresSafeArea(.all)
                    }
                    VStack {
                        if let image = viewModel.plantImage[plant.id] {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                                .frame(width: 200, height: 200)
                        } else {
                            Image("plant")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                                .frame(width: 200, height: 200)
                        }
                        Divider()
                            .padding()
                        VStack(alignment: .leading) {
                            cardView
                            dimensionsCard
                            watering
                        }
                        .padding()
                        Spacer()
                        
                    }
                }
                
            }
            .navigationTitle(viewModel.plantDetailsModel?.commonName ?? "No plant name")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchPlantDetails(id: plant.id)
                viewModel.loadImages(for: [plant])
            }
            
        }
    }

    
#Preview {
    PlantView(plant: Datum(id: 1, commonName: "Rose", scientificName: ["Black Rose"], otherName: ["Bleah, Crazi"], cycle: Cycle.herbaceousPerennial, watering: Watering.average, sunlight: Sunlight.fullSun))
}

fileprivate extension PlantView {
    var cardView: some View {
        HStack {
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Image(systemName: "person.fill.questionmark")
                            .foregroundColor(Color.white)
                            .font(.title)
                        VStack {
                            Text("Names")
                                .font(.title.bold())
                                
                        }
                    }
                    .padding(.bottom)
                }
                Text("Common Name: \(viewModel.plantDetailsModel?.commonName ?? "No common name")")
                Text("Other Name: \(viewModel.plantDetailsModel?.otherName.first ?? "No other name")")
                Text("Scientific Name: \(viewModel.plantDetailsModel?.scientificName.first ?? "No other name")")
                
            }
            .font(.headline)
            .multilineTextAlignment(.leading)
            .padding(5)
        }
        .padding(.all, 8) // Add padding to the HStack
        .background(colorScheme == .dark ? Color.cardDetailView : Color.white)
        .cornerRadius(10)
        .shadow(color: colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)

    }
    var watering: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "camera.macro")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.green)
                        .font(.title)
                    VStack {
                        Text("Care")
                            .font(.title.bold())
                            
                    }
                }
                .padding(.bottom)
                Text("Watering frequency: \(viewModel.plantDetailsModel?.watering ?? "No Data")")
                Text("Cycle type: \(viewModel.plantDetailsModel?.cycle ?? "No Data")")
                Text("Type of light: \(viewModel.plantDetailsModel?.sunlight.first ?? "No Data")")
            }
            .font(.headline)
            .multilineTextAlignment(.leading)
            .padding(5)
        }
        .padding(.all, 8) // Add padding to the HStack
        .background(colorScheme == .dark ? Color.cardDetailView : Color.white)
        .cornerRadius(10)
        .shadow(color: colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)

    }
    
    var dimensionsCard: some View {
        VStack(alignment: .leading, spacing: 10) {
                   Text("Dimensions")
                       .font(.title)
                       .fontWeight(.bold)
                   
            KeyValueView(key: "Type", value: viewModel.plantDetailsModel?.dimensions.type ?? "Unknown type")
                       KeyValueView(key: "Min Value", value: "\(viewModel.plantDetailsModel?.dimensions.minValue ?? 0)")
                       KeyValueView(key: "Max Value", value: "\(viewModel.plantDetailsModel?.dimensions.maxValue ?? 0)")
                       KeyValueView(key: "Unit", value: viewModel.plantDetailsModel?.dimensions.unit ?? "Unknown unit")
        }
        .padding(.all, 8) // Add padding to the HStack
        .background(colorScheme == .dark ? Color.cardDetailView : Color.white)
        .cornerRadius(10)
        .shadow(color: colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray4).opacity(0.4), radius: 5, x: 0, y: 2)
    }
}

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
