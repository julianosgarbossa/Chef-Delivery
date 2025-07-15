//
//  StoresService.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 14/07/25.
//

import Foundation

enum NetworkingError: Error, LocalizedError {
    case invalidURL
    case requestFailed(error: Error)
    case invalidResponse(statusCode: Int)
    case decodingFailed(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .requestFailed(let error):
            return "Erro na requisição: \(error.localizedDescription)"
        case .invalidResponse(let statusCode):
            return "Resposta HTTP inválida: status code \(statusCode)"
        case .decodingFailed(let error):
            return "Erro ao decodificar o JSON: \(error.localizedDescription)"
        }
    }
}

class HomeService {
    
    func fetchData() async throws -> [StoreType] {
        guard let url = URL(string: "https://private-cf6b5a-chefdelivery30.apiary-mock.com/stores") else {
            throw NetworkingError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Verifica se a resposta é válida
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                throw NetworkingError.invalidResponse(statusCode: httpResponse.statusCode)
            }
            
            do {
                let stores = try JSONDecoder().decode([StoreType].self, from: data)
                return stores
            } catch {
                throw NetworkingError.decodingFailed(error: error)
            }
            
        } catch {
            throw NetworkingError.requestFailed(error: error)
        }
    }
}
