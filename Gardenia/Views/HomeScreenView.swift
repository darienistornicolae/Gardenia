//
//  ContentView.swift
//  Gardenia
//
//  Created by Darie-Nistor Nicolae on 25.10.2023.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        TabView {
            GardenListView()
                .tabItem {
                    Image(systemName: "camera.macro")
                    Text("Garden")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .padding()
    }
}

#Preview {
    HomeScreenView()
}
