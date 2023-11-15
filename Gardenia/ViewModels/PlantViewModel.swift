//
//  PlantViewModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 08.11.2023.
//

import Foundation
import SwiftUI

class PlantViewModel: ObservableObject {
    
    @Published var plantDetailsModel: PlantDetailsModel?
    @Published var plantImage: [Int: UIImage] = [:]
    private let fetchPlant = APICall()
    
    
    func loadImages(for plants: [Datum]) {
       for plant in plants {
           Task {
               guard let imageURL = plant.defaultImage?.regular_url, let url = URL(string: imageURL) else { return }
               if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                   DispatchQueue.main.async {
                       self.plantImage[plant.id] = image
                   }
               }
           }
       }
   }
    
    
    func fetchPlantDetails(id: Int) {
        Task {
            do {
                
                let plantDetails = try await fetchPlant.fetchPlantDetailsData(id: id)
                DispatchQueue.main.async {
                    self.plantDetailsModel = plantDetails
                }
                
            } catch {
                print("Problems getting data: \(error)")
            }
        }
    }
    
}


