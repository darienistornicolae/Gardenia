//
//  SearchPlantListView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 18.11.2023.
//

import SwiftUI

struct SearchPlantListView: View {
    
    @State private var showAlert = false
    @State private var addedPlantName: String?
    @EnvironmentObject var garden: AuthenticationManager
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @StateObject var viewModel = AddPlantOnboardingViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
            
            VStack {
                searchBar
                
                List(viewModel.plants, id:\.id) { plant in
                    Button(action: {
                        Task {
                            try? await garden.addPlantToGarden(gardenId: garden.currentGarden?.gardenId ?? "", plant: plant, isPlantAdded: true)
                            showAlert = true
                            addedPlantName = plant.commonName
                            
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
                .listRowBackground(Color.black)
                .listStyle(.plain)
                .background(Color.gray)
                .cornerRadius(10)
                
                
                Spacer()
                Button(action: {
                    onboardingViewModel.currentPage += 1
                    onboardingViewModel.isOnboardingCompleted = true
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        
        Spacer()
    }
}

#Preview {
    SearchPlantListView()
}

fileprivate extension SearchPlantListView {
    
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
