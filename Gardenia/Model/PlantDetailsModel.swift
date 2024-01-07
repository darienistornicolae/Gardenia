//
//  PlantDetailsModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 14.11.2023.
//

import Foundation

struct PlantDetailsModel: Codable {
    var id: Int
    var commonName: String
    var scientificName: [String]
    var otherName: [String]
    var dimension: String
    var dimensions: Dimensions
    var cycle: String
  //  var sunlight: [Sunlight]?
    var watering: String
//    var depthWaterRequirement: [DepthWaterRequirement]
//    var volumeWaterRequirement: VolumeWaterRequirement
//    var pruningCount: PruningCount
    var description: String
    var defaultImage: DefaultPlantImage?
    var otherImages: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case otherName = "other_name"
        case dimension
        case dimensions
        case cycle
        case watering
      //  case sunlight
        case description = "description"
        case defaultImage = "default_image"
        case otherImages = "other_images"
    }
    
    
    
}

// MARK: - PlantAnatomy
struct PlantAnatomy: Codable {
    var part: String?
    var color: [String]?
}

// MARK: - DefaultImage
struct DefaultPlantImage: Codable {
    var license: Int
    var licenseName: String
    var licenseurl: String
    var originalurl: String
    var regularurl: String
    var mediumurl: String
    var smallurl: String
    var thumbnail: String

    enum CodingKeys: String, CodingKey {
        case license = "license"
        case licenseName = "license_name"
        case licenseurl = "license_url"
        case originalurl = "original_url"
        case regularurl = "regular_url"
        case mediumurl = "medium_url"
        case smallurl = "small_url"
        case thumbnail = "thumbnail"
    }
}
struct VolumeWaterRequirement: Codable {
    let unit: String?
    let value: String?
}
// MARK: - Dimensions
struct Dimensions: Codable {
    var type: String?
    var minValue: Int?
    var maxValue: Int?
    var unit: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case minValue = "min_value"
        case maxValue = "max_value"
        case unit = "unit"
    }
}

// MARK: - Hardiness
struct Hardiness: Codable {
    var min: String?
    var max: String?
}

// MARK: - HardinessLocation
struct HardinessLocation: Codable {
    var fullurl: String?
    var fullIframe: String?

    enum CodingKeys: String, CodingKey {
        case fullurl = "full_url"
        case fullIframe = "full_iframe"
    }
}
// MARK: - DepthWaterRequirement
struct DepthWaterRequirement: Codable {
    var unit: String?
    var value: String?

    enum CodingKeys: String, CodingKey {
        case unit
        case value
    }
    
}

struct PruningCount: Codable {
    var amount: Int?
    var interval: String?

}

// MARK: - WateringGeneralBenchmark
struct WateringGeneralBenchmark: Codable {
    var value: String?
    var unit: String?
}



// MARK: MOCK
//extension PlantDetailsModel {
//    static func mock() -> PlantDetailsModel {
//        return PlantDetailsModel(
//            id: 1,
//            commonName: "Mock Plant",
//            scientificName: ["Scientificus Mockus"],
//            otherName: ["Alias1", "Alias2"],
//            family: nil,
//            origin: ["Mock Origin"],
//            type: "Mock Type",
//            dimension: "Mock Dimension",
//            dimensions: Dimensions(type: "Mock Type", minValue: 10, maxValue: 20, unit: "cm"),
//            cycle: "Mock Cycle",
//            attracts: [],
//            propagation: ["Mock Propagation"],
//            hardiness: Hardiness(min: "Mock Min", max: "Mock Max"),
//            hardinessLocation: HardinessLocation(fullurl: "Mock Full URL", fullIframe: "Mock Full Iframe"),
//            watering: "Mock Watering",
//            depthWaterRequirement: [DepthWaterRequirement(unit: "", value: "")],
//            volumeWaterRequirement: VolumeWaterRequirement(unit: "", value: ""),
//            wateringPeriod: nil,
//            wateringGeneralBenchmark: WateringGeneralBenchmark(value: "Mock Value", unit: "Mock Unit"),
//            plantAnatomy: [],
//            sunlight: ["Mock Sunlight"],
//            pruningMonth: ["Mock Pruning Month"],
//            pruningCount: [PruningCount(amount: 2, interval: "")],
//            seeds: 100,
//            maintenance: "",
//            careGuides: "Mock Care Guides",
//            soil: [],
//            growthRate: "Mock Growth Rate",
//            droughtTolerant: true,
//            saltTolerant: false,
//            thorny: false,
//            invasive: true,
//            tropical: true,
//            indoor: false,
//            careLevel: "Mock Care Level",
//            pestSusceptibility: [],
//            pestSusceptibilityapi: "Mock Pest Susceptibility",
//            flowers: true,
//            floweringSeason: nil,
//            flowerColor: "Mock Flower Color",
//            cones: false,
//            fruits: true,
//            edibleFruit: true,
//            edibleFruitTasteProfile: "Mock Taste Profile",
//            fruitNutritionalValue: "Mock Nutritional Value",
//            fruitColor: [],
//            harvestSeason: "nil",
//            leaf: true,
//            leafColor: ["Mock Leaf Color"],
//            edibleLeaf: false,
//            cuisine: false,
//            medicinal: true,
//            poisonousToHumans: 0,
//            poisonousToPets: 0,
//            description: "Mock Plant Description",
//            defaultImage: DefaultPlantImage(
//                license: 1,
//                licenseName: "Mock License",
//                licenseurl: "Mock License URL",
//                originalurl: "Mock Original URL",
//                regularurl: "Mock Regular URL",
//                mediumurl: "Mock Medium URL",
//                smallurl: "Mock Small URL",
//                thumbnail: "Mock Thumbnail"
//            ),
//            otherImages: "Mock Other Images"
//        )
//    }
//}
