//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import Foundation

struct ProductType: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case price
    }
}
