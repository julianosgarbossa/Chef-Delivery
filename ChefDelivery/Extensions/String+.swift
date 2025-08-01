//
//  String+.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 01/08/25.
//

import Foundation

extension String: Searchable {
    func metches(term: String) -> Bool {
        return lowercased().hasPrefix(term)
    }
}
