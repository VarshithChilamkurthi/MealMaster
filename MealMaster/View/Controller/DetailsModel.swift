//
//  DetailsModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import Foundation

struct DetailsModel: Codable {
    let meals: [Details]?
}

struct Details: Codable {
    let setMeal: String?
    let strCategory: String?
    let strArea: String?
    
}
