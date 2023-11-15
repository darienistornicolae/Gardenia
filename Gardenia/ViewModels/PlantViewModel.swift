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
    
    func loadImages(for plants: PlantDetailsModel) {
        Task {
            if let imageURL = plants.defaultImage?.regularurl, let url = URL(string: imageURL) {
                do {
                    let data = try Data(contentsOf: url)
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.plantImage[plants.id] = image
                        }
                    }
                } catch {
                    print("Error loading image data: \(error)")
                }
            }
        }
    }
}

