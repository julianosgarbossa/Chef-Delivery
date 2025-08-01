//
//  Array+.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 01/08/25.
//

import Foundation

extension Array: Searchable where Element == String {
    func metches(term: String) -> Bool {
        return contains(where: { $0.lowercased().hasPrefix(term)} )
    }
}
