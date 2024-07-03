//
//  APIManager.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import Foundation

class APIManager {
    static let sharedInstance = APIManager()
    private init() {}
    
    func getApiData(url: String) async throws -> Data? {
        let url = URL(string: url)
        guard let url = url else { return nil }
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        return data
    }
}
