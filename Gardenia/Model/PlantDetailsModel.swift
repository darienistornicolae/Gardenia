//
//  PlantDetailsModel.swift
//  Gardenia
//
//  Created by Darie Nistor Nicolae on 14.11.2023.
//

import Foundation

struct PlantDetailsModel: Codable {
    let id: Int
    let commonName: String
    let scientificName: [String]
    let otherName: [String]
    let family: String?
    let origin: [String?]
    let type: String
    let dimension: String
    let dimensions: Dimensions
    let cycle: String
    let attracts: [String]
    let propagation: [String]
    let hardiness: Hardiness
    let hardinessLocation: HardinessLocation
    let watering: String
    let depthWaterRequirement: DepthWaterRequirement
    let volumeWaterRequirement: [String]
    let wateringPeriod: String?
    let wateringGeneralBenchmark: WateringGeneralBenchmark
    let plantAnatomy: [PlantAnatomy]
    let sunlight: [String]
    let pruningMonth: [String]
    let pruningCount: PruningCount
    let seeds: Int
    let maintenance: String?
    let careGuides: String
    let soil: [String]
    let growthRate: String
    let droughtTolerant: Bool
    let saltTolerant: Bool
    let thorny: Bool
    let invasive: Bool
    let tropical: Bool
    let indoor: Bool
    let careLevel: String?
    let pestSusceptibility: [String]
    let pestSusceptibilityapi: String
    let flowers: Bool
    let floweringSeason: String?
    let flowerColor: String
    let cones: Bool
    let fruits: Bool
    let edibleFruit: Bool
    let edibleFruitTasteProfile: String
    let fruitNutritionalValue: String
    let fruitColor: [String]
    let harvestSeason: String?
    let leaf: Bool
    let leafColor: [String]
    let edibleLeaf: Bool
    let cuisine: Bool
    let medicinal: Bool
    let poisonousToHumans: Int
    let poisonousToPets: Int
    let description: String
    let defaultImage: DefaultPlantImage?
    let otherImages: String

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case otherName = "other_name"
        case family
        case origin = "origin"
        case type = "type"
        case dimension = "dimension"
        case dimensions = "dimensions"
        case cycle = "cycle"
        case attracts = "attracts"
        case propagation = "propagation"
        case hardiness = "hardiness"
        case hardinessLocation = "hardiness_location"
        case watering = "watering"
        case depthWaterRequirement = "depth_water_requirement"
        case volumeWaterRequirement = "volume_water_requirement"
        case wateringPeriod = "watering_period"
        case wateringGeneralBenchmark = "watering_general_benchmark"
        case plantAnatomy = "plant_anatomy"
        case sunlight = "sunlight"
        case pruningMonth = "pruning_month"
        case pruningCount = "pruning_count"
        case seeds = "seeds"
        case maintenance = "maintenance"
        case careGuides = "care-guides"
        case soil = "soil"
        case growthRate = "growth_rate"
        case droughtTolerant = "drought_tolerant"
        case saltTolerant = "salt_tolerant"
        case thorny = "thorny"
        case invasive = "invasive"
        case tropical = "tropical"
        case indoor = "indoor"
        case careLevel = "care_level"
        case pestSusceptibility = "pest_susceptibility"
        case pestSusceptibilityapi = "pest_susceptibility_api"
        case flowers = "flowers"
        case floweringSeason = "flowering_season"
        case flowerColor = "flower_color"
        case cones = "cones"
        case fruits = "fruits"
        case edibleFruit = "edible_fruit"
        case edibleFruitTasteProfile = "edible_fruit_taste_profile"
        case fruitNutritionalValue = "fruit_nutritional_value"
        case fruitColor = "fruit_color"
        case harvestSeason
        case leaf = "leaf"
        case leafColor = "leaf_color"
        case edibleLeaf = "edible_leaf"
        case cuisine = "cuisine"
        case medicinal = "medicinal"
        case poisonousToHumans = "poisonous_to_humans"
        case poisonousToPets = "poisonous_to_pets"
        case description = "description"
        case defaultImage = "default_image"
        case otherImages = "other_images"
    }
    
    init(id: Int, commonName: String, scientificName: [String], otherName: [String], family: String?, origin: [String?], type: String, dimension: String, dimensions: Dimensions, cycle: String, attracts: [String], propagation: [String], hardiness: Hardiness, hardinessLocation: HardinessLocation, watering: String, depthWaterRequirement: DepthWaterRequirement, volumeWaterRequirement: [String], wateringPeriod: String?, wateringGeneralBenchmark: WateringGeneralBenchmark, plantAnatomy: [PlantAnatomy], sunlight: [String], pruningMonth: [String], pruningCount: PruningCount, seeds: Int, maintenance: String?, careGuides: String, soil: [String], growthRate: String, droughtTolerant: Bool, saltTolerant: Bool, thorny: Bool, invasive: Bool, tropical: Bool, indoor: Bool, careLevel: String?, pestSusceptibility: [String], pestSusceptibilityapi: String, flowers: Bool, floweringSeason: String?, flowerColor: String, cones: Bool, fruits: Bool, edibleFruit: Bool, edibleFruitTasteProfile: String, fruitNutritionalValue: String, fruitColor: [String], harvestSeason: String?, leaf: Bool, leafColor: [String], edibleLeaf: Bool, cuisine: Bool, medicinal: Bool, poisonousToHumans: Int, poisonousToPets: Int, description: String, defaultImage: DefaultPlantImage?, otherImages: String) {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.otherName = otherName
        self.family = family
        self.origin = origin
        self.type = type
        self.dimension = dimension
        self.dimensions = dimensions
        self.cycle = cycle
        self.attracts = attracts
        self.propagation = propagation
        self.hardiness = hardiness
        self.hardinessLocation = hardinessLocation
        self.watering = watering
        self.depthWaterRequirement = depthWaterRequirement
        self.volumeWaterRequirement = volumeWaterRequirement
        self.wateringPeriod = wateringPeriod
        self.wateringGeneralBenchmark = wateringGeneralBenchmark
        self.plantAnatomy = plantAnatomy
        self.sunlight = sunlight
        self.pruningMonth = pruningMonth
        self.pruningCount = pruningCount
        self.seeds = seeds
        self.maintenance = maintenance
        self.careGuides = careGuides
        self.soil = soil
        self.growthRate = growthRate
        self.droughtTolerant = droughtTolerant
        self.saltTolerant = saltTolerant
        self.thorny = thorny
        self.invasive = invasive
        self.tropical = tropical
        self.indoor = indoor
        self.careLevel = careLevel
        self.pestSusceptibility = pestSusceptibility
        self.pestSusceptibilityapi = pestSusceptibilityapi
        self.flowers = flowers
        self.floweringSeason = floweringSeason
        self.flowerColor = flowerColor
        self.cones = cones
        self.fruits = fruits
        self.edibleFruit = edibleFruit
        self.edibleFruitTasteProfile = edibleFruitTasteProfile
        self.fruitNutritionalValue = fruitNutritionalValue
        self.fruitColor = fruitColor
        self.harvestSeason = harvestSeason
        self.leaf = leaf
        self.leafColor = leafColor
        self.edibleLeaf = edibleLeaf
        self.cuisine = cuisine
        self.medicinal = medicinal
        self.poisonousToHumans = poisonousToHumans
        self.poisonousToPets = poisonousToPets
        self.description = description
        self.defaultImage = defaultImage
        self.otherImages = otherImages
    }
}

// MARK: - PlantAnatomy
struct PlantAnatomy: Codable {
    let part: String
    let color: [String]

    enum CodingKeys: String, CodingKey {
        case part
        case color
    }
}

// MARK: - DefaultImage
struct DefaultPlantImage: Codable {
    let license: Int
    let licenseName: String
    let licenseurl: String
    let originalurl: String
    let regularurl: String
    let mediumurl: String
    let smallurl: String
    let thumbnail: String

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

// MARK: - Dimensions
struct Dimensions: Codable {
    let type: String
    let minValue: Int
    let maxValue: Int
    let unit: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case minValue = "min_value"
        case maxValue = "max_value"
        case unit = "unit"
    }
}

// MARK: - Hardiness
struct Hardiness: Codable {
    let min: String
    let max: String

    enum CodingKeys: String, CodingKey {
        case min = "min"
        case max = "max"
    }
}

// MARK: - HardinessLocation
struct HardinessLocation: Codable {
    let fullurl: String
    let fullIframe: String

    enum CodingKeys: String, CodingKey {
        case fullurl = "full_url"
        case fullIframe = "full_iframe"
    }
}
// MARK: - DepthWaterRequirement
struct DepthWaterRequirement: Codable {
    let unit: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case unit
        case value
    }
}

struct PruningCount: Codable {
    let amount: Int
    let interval: String

    enum CodingKeys: String, CodingKey {
        case amount
        case interval
    }
}

// MARK: - WateringGeneralBenchmark
struct WateringGeneralBenchmark: Codable {
    let value: String
    let unit: String

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case unit = "unit"
    }
}



// MARK: MOCK
extension PlantDetailsModel {
    static func mock() -> PlantDetailsModel {
        return PlantDetailsModel(
            id: 1,
            commonName: "Mock Plant",
            scientificName: ["Scientificus Mockus"],
            otherName: ["Alias1", "Alias2"],
            family: nil,
            origin: ["Mock Origin"],
            type: "Mock Type",
            dimension: "Mock Dimension",
            dimensions: Dimensions(type: "Mock Type", minValue: 10, maxValue: 20, unit: "cm"),
            cycle: "Mock Cycle",
            attracts: [],
            propagation: ["Mock Propagation"],
            hardiness: Hardiness(min: "Mock Min", max: "Mock Max"),
            hardinessLocation: HardinessLocation(fullurl: "Mock Full URL", fullIframe: "Mock Full Iframe"),
            watering: "Mock Watering",
            depthWaterRequirement: DepthWaterRequirement(unit: "", value: ""),
            volumeWaterRequirement: [],
            wateringPeriod: nil,
            wateringGeneralBenchmark: WateringGeneralBenchmark(value: "Mock Value", unit: "Mock Unit"),
            plantAnatomy: [],
            sunlight: ["Mock Sunlight"],
            pruningMonth: ["Mock Pruning Month"],
            pruningCount: PruningCount(amount: 2, interval: ""),
            seeds: 100,
            maintenance: "",
            careGuides: "Mock Care Guides",
            soil: [],
            growthRate: "Mock Growth Rate",
            droughtTolerant: true,
            saltTolerant: false,
            thorny: false,
            invasive: true,
            tropical: true,
            indoor: false,
            careLevel: "Mock Care Level",
            pestSusceptibility: [],
            pestSusceptibilityapi: "Mock Pest Susceptibility",
            flowers: true,
            floweringSeason: nil,
            flowerColor: "Mock Flower Color",
            cones: false,
            fruits: true,
            edibleFruit: true,
            edibleFruitTasteProfile: "Mock Taste Profile",
            fruitNutritionalValue: "Mock Nutritional Value",
            fruitColor: [],
            harvestSeason: nil,
            leaf: true,
            leafColor: ["Mock Leaf Color"],
            edibleLeaf: false,
            cuisine: false,
            medicinal: true,
            poisonousToHumans: 0,
            poisonousToPets: 0,
            description: "Mock Plant Description",
            defaultImage: DefaultPlantImage(
                license: 1,
                licenseName: "Mock License",
                licenseurl: "Mock License URL",
                originalurl: "Mock Original URL",
                regularurl: "Mock Regular URL",
                mediumurl: "Mock Medium URL",
                smallurl: "Mock Small URL",
                thumbnail: "Mock Thumbnail"
            ),
            otherImages: "Mock Other Images"
        )
    }
}
