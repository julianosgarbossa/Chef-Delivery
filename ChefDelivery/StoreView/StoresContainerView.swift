//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 28/05/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    
    let title = "Lojas"
    @State private var ratingFilter: Int = 0
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()

                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating == 1 {
                                Text("\(rating) estrela ou mais")
                            } else if rating == 5 {
                                Text("\(rating) estrelas")
                            } else {
                                Text("\(rating) estrelas ou mais")
                            }
                        }
                    }
                }
                .foregroundStyle(.black)
            }
            VStack(alignment: .leading, spacing: 30) {
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    StoresContainerView()
        .background(Color.gray.opacity(0.1))
}
