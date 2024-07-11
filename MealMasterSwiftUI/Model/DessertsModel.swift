//
//  DessertsModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import Foundation

struct DessertsModel: Codable {
    let meals: [Dessert]?
}

struct Dessert: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
