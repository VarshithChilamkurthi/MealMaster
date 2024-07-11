//
//  CategoriesModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import Foundation

struct CategoriesModel: Codable {
    let meals: [FoodCategory]?
}

struct FoodCategory: Codable {
    let strCategory: String?
}
