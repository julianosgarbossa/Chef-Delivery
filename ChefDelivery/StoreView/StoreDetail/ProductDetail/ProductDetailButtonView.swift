//
//  ProductDetailButtonView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import SwiftUI

struct ProductDetailButtonView: View {
    var body: some View {
        Button {
            print("Botão pressionado!")
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}

#Preview {
    ProductDetailButtonView()
}
