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
    //  var sunlight: [String]
    var defaultImage: DefaultImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case otherName = "other_name"
        case cycle, watering
        case defaultImage = "default_image"
    }
    init(id: Int, commonName: String, scientificName: [String], otherName: [String], cycle: Cycle, watering: Watering, defaultImage: DefaultImage? = nil) {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.otherName = otherName
        self.cycle = cycle
        self.watering = watering
        self.defaultImage = defaultImage
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        commonName = try values.decode(String.self, forKey: .commonName)
        scientificName = try values.decode([String].self, forKey: .scientificName)
        otherName = try values.decode([String].self, forKey: .otherName)
        
        // try to decode `cycle`, if fails, set it to `.perennial`
        cycle = (try? values.decode(Cycle.self, forKey: .cycle)) ?? .perennial
        
        // try to decode `watering`, if fails, set it to `.other`
        watering = (try? values.decode(Watering.self, forKey: .watering)) ?? .none
        
        // try to decode `sunlight`, if fails, set it to an empty array
        //  sunlight = (try? values.decode([Sunlight].self, forKey: .sunlight)) ?? [.filteredShade]
        
        // try to decode `defaultImage`, if fails, set it to `nil`
        defaultImage = try? values.decode(DefaultImage?.self, forKey: .defaultImage)
    }
}

enum Cycle: String, Codable {
    case herbaceousPerennial = "Herbaceous Perennial"
    case perennial = "Perennial"
}

// MARK: - DefaultImage
struct DefaultImage: Codable {
    var license: Int
    var licenseName: String
    var licenseURL: String
    var originalURL: String
    var regularURL, mediumURL, smallURL, thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case license
        case licenseName = "license_name"
        case licenseURL = "license_url"
        case originalURL = "original_url"
        case regularURL = "regular_url"
        case mediumURL = "medium_url"
        case smallURL = "small_url"
        case thumbnail
    }
}

enum Sunlight: String, Codable {
    case filteredShade = "filtered shade"
    case fullSun = "full sun"
    case partShade = "part shade"
    case partSunPartShade = "part sun/part shade"
    case sunlightFullSun = "Full sun"
}

enum Watering: String, Codable {
    case average = "Average"
    case frequent = "Frequent"
    case minimum = "Minimum"
    case none = "None"
}
