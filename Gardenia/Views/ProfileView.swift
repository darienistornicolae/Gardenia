//
//  HomeScreenView.swift
//  Gardening
//
//  Created by Darie-Nistor Nicolae on 06.07.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var manager: AuthenticationManager
    @State private var actionToggle = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let user = manager.currentUser {
            ZStack {
                List {
                    Section("Profile") {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight (.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                            }
                        }
                    }
                    
                    
                    Section("Settings") {
                        SettingsRowView(imageName: "gearshape", title: "Version", tintColor: .teal, actionToggle: nil)
                        SettingsRowView(imageName: "moon", title: "Dark Mode", tintColor: .blue, actionToggle: $actionToggle)
                    }
                    
                    Section("Account") {
                        Button {
                             manager.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color.red, actionToggle: nil)
                        }
                        
                        Button {
                            Task {
                                try await manager.resetPassword(email: manager.currentUser?.email ?? "No email")
                                print("Password Reset")
                            }
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Reset Password", tintColor: Color.red,  actionToggle: nil)
                        }
                    }
                }
            }
        }
    }
    
    
    
    struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
                .environmentObject(AuthenticationManager())
        }
    }
}
