//
//  AddGardenView.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 20.11.2023.
//

import SwiftUI

struct AddGardenView: View {
    @StateObject var viewModel = CreateGardenOnboardingViewModel()
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var garden: AuthenticationManager
    @EnvironmentObject private var onboardingViewModel: OnboardingViewModel
    
    init(viewModel: @autoclosure @escaping () -> CreateGardenOnboardingViewModel) {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self._viewModel = StateObject(wrappedValue: viewModel())
        
    }
    
    var body: some View {
        
        VStack {
            
            InputView(text: $viewModel.gardenName, placeholder: "Input your garden name")
                .foregroundColor(Color(colorScheme == .dark ? .white : .black))
            Spacer()
            
            NavigationLink {
                SearchPlantView(viewModel: AddPlantOnboardingViewModel())
                
            } label: {
                Text("Add Garden")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Hello gardner!")
        .padding(20)
        
    }
}



#Preview {
    AddGardenView(viewModel: CreateGardenOnboardingViewModel())
}
