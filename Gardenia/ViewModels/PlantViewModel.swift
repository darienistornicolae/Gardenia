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
}
