//
//  GardenManager.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 05.11.2023.
//

import Foundation
import Firebase


extension AuthenticationManager {
    
    
    func createGarden(gardenName: String, plants: [Datum]) async throws {
        guard let currentUser = currentUser else {
            currentUser = nil
            return
        }
        
        let gardenId = UUID().uuidString
        
        do {
            let garden = Garden(gardenId: gardenId, gardenName: gardenName, plants: PlantsModel(data: plants, total: plants.count))
            
            let jsonEncoder = JSONEncoder()
            let encodedGarden = try jsonEncoder.encode(garden)
            guard let gardenData = try JSONSerialization.jsonObject(with: encodedGarden, options: []) as? [String: Any] else {
                throw NSError(domain: "SerializationError", code: -1, userInfo: nil)
            }
            
            let userGardensRef = dataBase.collection("users").document(currentUser.id).collection("Gardens")
            try await userGardensRef.document(gardenId).setData(gardenData) // Save the garden data as a document in the subcollection
            
            self.currentGarden = garden
        } catch {
            print("ERROR: Garden creation failed. \(error.localizedDescription)")
        }
    }
    
    func addPlantToGarden(gardenId: String, plant: Datum, isPlantAdded: Bool) async throws {
        guard let currentUser = currentUser else {
            return
        }
        
        let userGardensRef = Firestore.firestore().collection("users").document(currentUser.id).collection("Gardens")
        let gardenDocument = userGardensRef.document(gardenId)
        
        // Fetch the current garden document
        let gardenDocumentSnapshot = try await gardenDocument.getDocument()
        
        // Decode it to a Garden if it exists, otherwise create a new one
        var garden: Garden
        if let existingGarden = try? gardenDocumentSnapshot.data(as: Garden.self) {
            garden = existingGarden
        } else {
            garden = Garden(gardenId: gardenId, gardenName: "New Garden", plants: PlantsModel(data: [], total: 0))
        }
        
        
        if isPlantAdded {
            
            garden.plants.data.append(plant)
            garden.plants.total += 1
            
        } else {
            
            if let index = garden.plants.data.firstIndex(where: { $0.id == plant.id }) {
                garden.plants.data.remove(at: index)
            }
            
            garden.plants.total -= 1
        }
        
        try gardenDocument.setData(from: garden)
        
        self.currentGarden = garden
    }
    
    func deleteGarden() async throws {
        guard let currentUser = currentUser, let currentGarden = currentGarden else {
            return
        }
        
        let userGardensRef = Firestore.firestore().collection("users").document(currentUser.id).collection("Gardens")
        let gardenDocument = userGardensRef.document(currentGarden.gardenId)
        
        do {
            try await gardenDocument.delete()
            self.currentGarden = nil
        } catch {
            throw error
        }
    }
    
    func deletePlant(gardenId: String, plantId: Int) async throws {
        guard let currentUser = currentUser else {
            return
        }
        
        let userGardensRef = Firestore.firestore().collection("users").document(currentUser.id).collection("Gardens")
        let gardenDocument = userGardensRef.document(gardenId)
        
        do {
            // Fetch the current garden document
            let gardenDocumentSnapshot = try await gardenDocument.getDocument()
            
            // Decode it to a Garden if it exists
            var garden: Garden
            if let existingGarden = try? gardenDocumentSnapshot.data(as: Garden.self) {
                garden = existingGarden
            } else {
                throw NSError(domain: "GardenNotFoundError", code: -1, userInfo: nil)
            }
            
            // Remove the plant with the specified id
            if let index = garden.plants.data.firstIndex(where: { $0.id == plantId }) {
                garden.plants.data.remove(at: index)
                garden.plants.total -= 1
            } else {
                throw NSError(domain: "PlantNotFoundError", code: -1, userInfo: nil)
            }
            
            // Update the garden in Firestore
            try gardenDocument.setData(from: garden)
            
            self.currentGarden = garden
        } catch {
            throw error
        }
    }
}
