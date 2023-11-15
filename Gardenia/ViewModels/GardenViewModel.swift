//
//  GardenViewModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 15.11.2023.
//

import Foundation
import SwiftUI

class GardenViewModel: ObservableObject {
    @Published var images: [Int: UIImage] = [:]
    
     func loadImages(for plants: [Datum]) {
        for plant in plants {
            Task {
                guard let imageURL = plant.defaultImage?.regular_url, let url = URL(string: imageURL) else { return }
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.images[plant.id] = image
                    }
                }
            }
        }
    }
}
