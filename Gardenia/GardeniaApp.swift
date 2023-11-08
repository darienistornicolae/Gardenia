//
//  GardeniaApp.swift
//  Gardenia
//
//  Created by Darie-Nistor Nicolae on 25.10.2023.
//

import SwiftUI
import Firebase

@main
struct GardeniaApp: App {
    
    @StateObject var authViewModel = AuthenticationManager()
    
    init() {
        FirebaseApp.configure()
        
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
//        Purchases.logLevel = .debug
//        Purchases.configure(withAPIKey: "appl_jWKLVAnpkjXeJobUQlyOrzLRkkn")
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authViewModel)
        }
    }
}
