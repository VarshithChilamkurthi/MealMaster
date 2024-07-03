//
//  DessertsViewModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import Foundation

class DessertsViewModel {
    var desserts: [Dessert]?
    
    func fetchData(url: String) async throws -> () {
        if let data = try await APIManager.sharedInstance.getApiData(url: url) {
            desserts = decodeData(data: data)
        }
    }
    
    func decodeData(data: Data) -> ([Dessert]?) {
            do {
                let decodedData = try JSONDecoder().decode(DessertsModel.self, from: data)
                return decodedData.meals
            } catch {
                print("not decoded")
                return nil
            }
    }
}
