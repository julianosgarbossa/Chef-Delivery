//
//  SearchStoreViewModel.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 30/07/25.
//

import Foundation

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
    
    func filteredStores() -> [StoreTypeTwo] {
        if searchText.isEmpty {
            return storesType
        }
        
        return storesType.filter { store in
            store.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}

