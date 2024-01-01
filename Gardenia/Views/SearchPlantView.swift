//
//  SearchPlantView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 19.11.2023.
//

import SwiftUI
import Firebase

struct SearchPlantView: View {
    @State private var showAlert = false
    @State private var addedPlantName: String?
    @EnvironmentObject var garden: AuthenticationManager
    @StateObject var viewModel = AddPlantOnboardingViewModel()
    let dataBase = Firestore.firestore()
    
    init(viewModel: @autoclosure @escaping () -> AddPlantOnboardingViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
        
    }
    var body: some View {
        
        VStack {
            searchBar
            
            List(viewModel.plants, id:\.id) { plant in
                Button(action: {
                    Task {
                        do {
                            guard let currentGarden = garden.currentGarden else {
                                print("Error: Current garden is not set.")
                                
                                return
                            }
                            
                            try await garden.addPlantToGarden(gardenId: currentGarden.gardenId, plant: plant, isPlantAdded: true)
                            showAlert = true
                            addedPlantName = plant.commonName
                        } catch {
                            print("Error adding plant to garden: \(error)")
                        }
                    }
                }) {
                    HStack {
                        if let image = viewModel.images[plant.id] {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        } else {
                            Image("plant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }
                        
                        Text(plant.commonName)
                    }
                }
                
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Plant Added"),
                    message: addedPlantName.map { Text(" \($0) has been successfully added to your garden.") } ?? Text("Plant added successfully."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .listRowBackground(Color.darkModeColor)
            .listStyle(.plain)
            .cornerRadius(10)
            
        }
        .padding()
        .navigationTitle("Search Plant")
        
        Spacer()
    }
}


#Preview {
    SearchPlantView(viewModel: AddPlantOnboardingViewModel())
}

fileprivate extension SearchPlantView {
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField("Search plant...", text: $viewModel.searchPlantName)
                .onChange(of: viewModel.searchPlantName) { newValue in
                    viewModel.search(query: newValue)
                    
                }
        }
        .frame(maxWidth: 350)
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}
