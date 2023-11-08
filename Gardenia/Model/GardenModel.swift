//
//  GardenModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 05.11.2023.
//

import Foundation


struct Garden: Codable {
    let gardenId: String
    let gardenName: String
    var plants: PlantsModel
    
}

// MARK: - Datum
struct PlantsModel: Codable {
    var data: [Datum]
    var total: Int
    
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    var id: Int
    var commonName: String
    var scientificName, otherName: [String]
    var cycle: Cycle
    var watering: Watering
    var sunlight: Sunlight
    var defaultImage: DefaultImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case otherName = "other_name"
        case cycle, watering, sunlight
        case defaultImage = "default_image"
    }
    init(id: Int, commonName: String, scientificName: [String], otherName: [String], cycle: Cycle, watering: Watering,sunlight: Sunlight, defaultImage: DefaultImage? = nil) {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.otherName = otherName
        self.cycle = cycle
        self.watering = watering
        self.sunlight = sunlight
        self.defaultImage = defaultImage
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        commonName = try values.decode(String.self, forKey: .commonName)
        scientificName = try values.decode([String].self, forKey: .scientificName)
        otherName = try values.decode([String].self, forKey: .otherName)
        cycle = (try? values.decode(Cycle.self, forKey: .cycle)) ?? .none
        watering = (try? values.decode(Watering.self, forKey: .watering)) ?? .none
        sunlight = (try? values.decode(Sunlight.self, forKey: .sunlight)) ?? .filteredShade
        defaultImage = try? values.decode(DefaultImage?.self, forKey: .defaultImage)
    }
}

enum Cycle: String, Codable {
    case herbaceousPerennial = "Herbaceous Perennial"
    case perennial = "Perennial"
    case bieannial = "Bieannial"
    case biannual = "Biannual"
    case annual = "Annual"
    case none = "none"
}

// MARK: - DefaultImage
struct DefaultImage: Codable {
    var license: Int
    var license_name: String
    var license_url: String
    var original_url: String
    var regular_url, medium_url, small_url, thumbnail: String?
    
}

enum Sunlight: String, Codable {
    case filteredShade = "filtered shade"
    case fullSun = "full sun"
    case partShade = "part shade"
    case partSunPartShade = "part sun/part shade"
    case sunlightFullSun = "Sunlight Full sun"
    case none = "none"
}

enum Watering: String, Codable {
    case average = "Average"
    case frequent = "Frequent"
    case minimum = "Minimum"
    case none = "None"
}
