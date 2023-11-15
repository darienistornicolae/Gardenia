//
//  PlantViewModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 08.11.2023.
//

import Foundation
import SwiftUI

class PlantViewModel: ObservableObject {
    
    @Published var plantImage: [Int: UIImage] = [:]
    private let fetchPlant = APICall()
    
    
//    func loadImages(for plants: PlantDetailsModel) {
//        Task {
//            if let imageURL = plants.defaultImage?.regularurl, let url = URL(string: imageURL) {
//                do {
//                    let data = try Data(contentsOf: url)
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self.plantImage[plants.id] = image
//                        }
//                    }
//                } catch {
//                    print("Error loading image data: \(error)")
//                }
//            }
//        }
//    }
    enum PlantDetailsError: Error {
        case invalidURL
        case networkError(Error)
        case decodingError(Error)
    }

    func fetchPlantDetails(id: Int) {
        Task {
            do {
                // Use try await instead of try? await to handle errors
                let call = try await fetchPlant.fetchPlantDetailsData(id: id)
                
            } catch {
                // Handle other errors
                print("Problems getting data: \(error)")
            }
        }
    }

    }


