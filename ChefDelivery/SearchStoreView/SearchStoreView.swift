//
//  SearchStoreView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 30/07/25.
//

import SwiftUI

struct SearchStoreView: View {
    
    @State var storesType: [StoreTypeTwo] = []
    private let service = SearchService()
    
    var body: some View {
        VStack {
            List {
                ForEach(storesType, id: \.id) { store in
                    Text(store.name)
                        .font(.subheadline)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                }
            }
            .padding(.top, 15)
            .listStyle(PlainListStyle())
            .scrollIndicators(.hidden)
            
            Spacer()
        }
        .onAppear() {
            self.fetchData()
        }
    }
    
    // MARK: - Methods
    
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
    
}

#Preview {
    SearchStoreView()
}
