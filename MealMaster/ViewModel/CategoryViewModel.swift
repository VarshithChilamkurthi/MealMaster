//
//  CategoryViewModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import Foundation

class CategoryViewModel {
    var categories: [FoodCategory]?
    var categoryImages = ["beef", "breakfast", "chicken", "dessert", "goat", "lamb", "misc", "pasta", "pork", "seafood", "side", "starter", "vegan", "vegetarian"]
    
    func fetchData(url: String) async throws -> () {
        if let data = try await APIManager.sharedInstance.getApiData(url: url) {
            categories = decodeData(data: data)
        }
    }
    
    func decodeData(data: Data) -> ([FoodCategory]?) {
            do {
                let decodedData = try JSONDecoder().decode(CategoriesModel.self, from: data)
                return decodedData.meals
            } catch {
                print("not decoded")
                return nil
            }
    }
}
