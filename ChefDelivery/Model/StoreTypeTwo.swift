//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import Foundation

protocol Searchable {
    func metches(term: String) -> Bool
}

struct StoreTypeTwo: Identifiable, Decodable {
    let id: Int
    let name: String
    let location: String
    let stars: Int
    let specialties: [String]?
}

extension StoreTypeTwo: Searchable {
    func metches(term: String) -> Bool {
        guard let specialties = specialties else {
            return false
        }
        
        let parameters: [Searchable] = [name, specialties] 
        
        return parameters.contains(where: { $0.metches(term: term.lowercased() )} )
    }
}


