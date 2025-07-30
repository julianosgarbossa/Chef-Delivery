//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import Foundation

struct StoreTypeTwo: Identifiable, Decodable {
    let id: Int
    let name: String
    let location: String
    let stars: Int
}
