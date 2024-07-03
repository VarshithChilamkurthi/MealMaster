//
//  MockCategoryViewModel.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import Foundation

class MockCategoryViewModel {
    var categories: [FoodCategory]? = mockData()
    
    static func mockData() -> [FoodCategory] {
        [FoodCategory(strCategory: "Beef"),
         FoodCategory(strCategory: "Breakfast")
        ]
    }
}
