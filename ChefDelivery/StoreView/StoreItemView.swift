//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 28/05/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            Text(order.name)
                .font(.subheadline)
            Spacer()
        }
        .onTapGesture {
            print("Você tocou em \(order.name)")
        }
    }
}

#Preview {
    StoreItemView(order: OrderType(id: 1, name: "Monstro Burguer", image: "monstro-burger-logo"))
        .background(Color.gray.opacity(0.1))
}
