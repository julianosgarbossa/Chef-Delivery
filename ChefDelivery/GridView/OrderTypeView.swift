//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 27/05/25.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: OrderType
    
    var body: some View {
        VStack(spacing: 5) {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: true)
            Text(orderType.name)
                .font(.system(size: 10))
        }
        .frame(width: 70, height: 100)
    }
}

#Preview {
    OrderTypeView(orderType: OrderType(id: 1, name: "Restaurantes", image: "hamburguer"))
        .background(Color.gray.opacity(0.1))
}
