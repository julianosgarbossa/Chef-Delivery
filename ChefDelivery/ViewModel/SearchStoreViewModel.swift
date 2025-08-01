//
//  SearchStoreViewModel.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 30/07/25.
//

import Foundation

enum SearchError: Error {
    case noResultsFound
}

class SearchStoreViewModel: ObservableObject {
    
    // MARK: - Attributes
    let service: SearchService
    @Published var storesType: [StoreTypeTwo] = []
    @Published var searchText: String = ""
    
    init(service: SearchService) {
        self.service = service
    }
    
    // MARK: - Methods
    @MainActor
    func fetchData() {
        Task {
            do {
                let result = try await service.fetchData()
                switch result {
                case .success(let stores):
                    self.storesType = stores
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func filteredStores() throws -> [StoreTypeTwo] {
        if searchText.isEmpty {
            return storesType
        }
        
        let filteredList = storesType.filter { $0.metches(term: searchText.lowercased()) }
        
        if filteredList.isEmpty {
            throw SearchError.noResultsFound
        }
        
        return filteredList
    }
}

