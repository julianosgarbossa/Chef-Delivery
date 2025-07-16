//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 27/05/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Attributes
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading: Bool = true
    
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await getStores()
            }
        }
    }
    
    // MARK: - Methods
    func getStores() async {
        do {
            let result = try await service.fetchData()
            self.storesType = result
            self.isLoading = false
        } catch {
            print("Erro ao buscar lojas: \(error.localizedDescription)")
            self.isLoading = false
        }
    }
}

#Preview {
    HomeView()
}
