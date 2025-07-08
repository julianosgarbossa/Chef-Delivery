//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 07/07/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductsView(products: store.products)
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundStyle(Color("ColorRed"))
                    }
                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[2])
}
