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
    var body: some View {
        NavigationView{
            VStack {
                List(viewModel.garden, id: \.gardenId) { garden in
                    //Text(garden.gardenName)
//                    NavigationLink(garden.gardenName, destination: {
//                        GardenView(garden: garden)
//                    })
                    NavigationLink {
                        GardenView(garden: garden)
                    } label: {
                        GardenCardView(garden: garden)
                    }
                }
                
            }
            .navigationTitle("\(userManager.currentUser?.fullName ?? "Gardens")'s Gardens")
            .onAppear {
                if let userId = Auth.auth().currentUser?.uid  {
                    self.viewModel.fetchGarden(forUserID: userId)
                }
            }
        }
        
    }
}



struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenListView()
    }
}
