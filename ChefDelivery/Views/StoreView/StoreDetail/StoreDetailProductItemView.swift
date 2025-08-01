//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    
    let product: ProductType
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text(product.description)
                    .foregroundStyle(.black.opacity(0.5))
                    .multilineTextAlignment(.leading)
                
                Text(product.price, format: .currency(code: "BRL"))
                    .bold()
                    .multilineTextAlignment(.leading)
                
            }
            Spacer()
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
            
        }
        .padding()
        .foregroundStyle(.black)
    }
}

#Preview {
    StoreDetailProductItemView(product: storesMock[0].products[0])
}
