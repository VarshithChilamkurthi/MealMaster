//
//  DetailsViewModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import Foundation

class DetailsViewModel {
    var details: [Details]?
    
    func fetchData(url: String) async throws -> () {
        if let data = try await APIManager.sharedInstance.getApiData(url: url) {
            details = decodeData(data: data)
        }
    }
    
    func decodeData(data: Data) -> ([Details]?) {
            do {
                let decodedData = try JSONDecoder().decode(DetailsModel.self, from: data)
                return decodedData.meals
            } catch {
                print("not decoded")
                return nil
            }
    }
}
