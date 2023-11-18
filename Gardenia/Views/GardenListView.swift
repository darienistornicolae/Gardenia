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
    
    init(viewModel: @autoclosure @escaping () -> GardenListViewModel) {
        
        self._viewModel = StateObject(wrappedValue: viewModel())
       
    }
    var body: some View {
        NavigationView{
            VStack {
                List(viewModel.garden, id: \.gardenId) { garden in
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
        GardenListView(viewModel: GardenListViewModel())
    }
}
