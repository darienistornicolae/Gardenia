//
//  AddPlantOnboardingView.swift
//  Gardening
//
//  Created by Darie-Nistor Nicolae on 10.07.2023.
//

import SwiftUI

struct AddPlantOnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = AddPlantOnboardingViewModel()
   
    @EnvironmentObject var garden: AuthenticationManager
    
    init(viewModel: @autoclosure @escaping () -> AddPlantOnboardingViewModel) {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self._viewModel = StateObject(wrappedValue: viewModel())
       
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if colorScheme == .dark {
                    LinearGradient(colors: [Color.black, Color.green], startPoint: .bottom, endPoint: .top)
                        .ignoresSafeArea(.all)
                } else {
                    LinearGradient(colors: [Color.blue, Color.green], startPoint: .bottom, endPoint: .top)
                        .ignoresSafeArea(.all)
                }
                VStack {
                    Text("Great! Now, it's time to add some plants into your garden! You can add as many plants as you want.")
                        .multilineTextAlignment(.leading)
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    SearchPlantListView()
                    
                    Spacer()
                }
                .navigationTitle(garden.currentGarden?.gardenName ?? "No name")
                
                .padding()
            }
        }
    }
}

struct AddPlantOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantOnboardingView(viewModel: AddPlantOnboardingViewModel())
            .environmentObject(AuthenticationManager())
    }
}
