//
//  Constants.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import Foundation
import UIKit

let sb = UIStoryboard(name: "Main", bundle: nil)

enum Constants: String {
    case categoryListUrl = "https://www.themealdb.com/api/json/v1/1/list.php?c=list"
    case dessertsListUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    case mealDetailsUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
}

enum ServerErrors: String {
    case invalidFetch = "Encountered error while fetching data from API Url"
    case invalidDecode = "Unable to decode the data"
}
