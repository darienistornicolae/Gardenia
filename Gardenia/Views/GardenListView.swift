//
//  GardenView.swift
//  Gardening
//
//  Created by Darie-Nistor Nicolae on 26.07.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct GardenListView: View {
    @StateObject var viewModel = GardenListViewModel()
    @StateObject var userManager = AuthenticationManager()
    @State private var selectedGardenId: String?

    init(viewModel: @autoclosure @escaping () -> GardenListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
            NavigationView {
                VStack {
                    List(viewModel.garden, id: \.gardenId) { garden in
                        NavigationLink(destination: GardenView(garden: garden)) {
                            GardenCardView(garden: garden)
                        }
                    }
                }
                .navigationTitle("\(userManager.currentUser?.fullName ?? "Gardens")'s Gardens")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: AddGardenView(viewModel: CreateGardenOnboardingViewModel())) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .onChange(of: selectedGardenId, perform: { newSelectedGardenId in
                    Task {
                        if let selectedGarden = viewModel.garden.first(where: { $0.gardenId == newSelectedGardenId }) {
                            await userManager.fetchUserGardens(selectedGarden: selectedGarden)
                        }
                    }
                })
                .onAppear {
                    if let userId = Auth.auth().currentUser?.uid {
                        viewModel.fetchGarden(forUserID: userId)
                    }
                }
            }
        }
}




struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenListView(viewModel: GardenListViewModel())
    }
}
