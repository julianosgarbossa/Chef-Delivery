//
//  StoresService.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 14/07/25.
//

import Foundation
import Alamofire

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
    
    func fetchDataWithAlamofire(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request("https://private-cf6b5a-chefdelivery30.apiary-mock.com/stores").responseDecodable(of: [StoreType].self) { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
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
    
    func confirmOrder(product: ProductType) async throws -> [String: String] {
        guard let url = URL(string: "https://private-cf6b5a-chefdelivery30.apiary-mock.com/stores") else {
            throw NetworkingError.invalidURL
        }
        
        let encodedProduct = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedProduct
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                throw NetworkingError.invalidResponse(statusCode: httpResponse.statusCode)
            }
            
            let message = try JSONSerialization.jsonObject(with: data) as? [String: String]
            return message ?? [:]
            
        } catch {
            throw NetworkingError.requestFailed(error: error)
        }
    }
}
