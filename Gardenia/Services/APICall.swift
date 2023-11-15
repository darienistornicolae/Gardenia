//
//  APICall.swift
//  Gardening
//
//  Created by Darie-Nistor Nicolae on 10.07.2023.
//

import Foundation
import Combine
import SwiftUI

class Debouncer {
    private var workItem: Task<Void, Never>?
    
    func debounce(interval: TimeInterval, action: @escaping () async -> Void) {
        workItem?.cancel()
        workItem = Task.init {
           try? await Task.sleep(nanoseconds: UInt64(interval * 1_000_000_000))  // interval in nanoseconds
            await action()
        }
    }
}

class APICall: ObservableObject {
    
    private var debouncer = Debouncer()
    private let apiKey: String = "sk-SWhc64a73409f079d1492"
    
    func fetchData(query: String) async -> [Datum] {
        let baseURL = "https://perenual.com/api/species-list?page=1&key=\(apiKey)"
        let urlString = baseURL + "&q=" + URLEncode(query)
        
        do {
            guard let url = URL(string: urlString) else { return [] }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(PlantsModel.self, from: data)
            return decodedData.data
        } catch {
            print("Error: \(error)")
            return []
        }
    }
    
    func performSearch(query: String, completionHandler: @escaping ([Datum]) -> Void) {
        debouncer.debounce(interval: 0.5) { [self] in
            let results = await self.fetchData(query: query)
            DispatchQueue.main.async {
                completionHandler(results)
            }
        }
    }
    
    func URLEncode(_ string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    enum PlantDetailsError: Error {
        case invalidURL
        case networkError(Error)
        case decodingError(Error)
    }

    func fetchPlantDetailsData(id: Int) async throws -> PlantDetailsModel {
        let baseURL = "https://perenual.com/api/species/details/\(id)?key=\(apiKey)"
        
        guard let url = URL(string: baseURL) else {
            throw PlantDetailsError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(PlantDetailsModel.self, from: data)
            print(decodedData)
            return decodedData
            
        } catch let networkError as NSError {
            throw PlantDetailsError.networkError(networkError)
        } catch {
            throw PlantDetailsError.decodingError(error)
        }
    }

}



