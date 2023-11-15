//
//  GardenViewModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 27.10.2023.
//

import Foundation
import Firebase
import Combine

class GardenListViewModel: ObservableObject {
    @Published var garden = [Garden]()
    
    private let dataBase = Firestore.firestore()
    
    func fetchGarden(forUserID userID: String) {
        let userGardensRef = dataBase.collection("users").document(userID).collection("Gardens")
        
        userGardensRef.addSnapshotListener { [weak self] (querySnapshot, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self?.garden = documents.map { queryDocumentSnapshot -> Garden in
                let data = queryDocumentSnapshot.data()
                
                guard let json = try? JSONSerialization.data(withJSONObject: data) else {
                    fatalError()
                }
                let decoder = JSONDecoder()
                let decodedGarden = try? decoder.decode(Garden.self, from: json)
                if let decodedGarden {
                    return decodedGarden
                } else {
                    fatalError("Decoding failed")
                }
                
            }
            
           

        }
    }
}
