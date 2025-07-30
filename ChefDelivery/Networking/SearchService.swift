//
//  SearchService.swift
//  ChefDelivery
//
//  Created by Ândriu F Coelho on 21/04/24.
//

import Foundation

struct SearchService {
    
    func fetchData() async throws -> Result<[StoreTypeTwo], NetworkingError> {
        guard let url = URL(string: "https://private-cf6b5a-chefdelivery30.apiary-mock.com/search") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreTypeTwo].self, from: data)
        
        return .success(storesObjects)
    }
    
}
