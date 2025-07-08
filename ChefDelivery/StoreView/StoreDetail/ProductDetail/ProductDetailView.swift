//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    var body: some View {
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView()
            
            Spacer()
            
            ProductDetailButtonView()
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[1].products[2])
}
