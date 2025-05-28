//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 27/05/25.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    CarouselItemView(order: OrderType(id: 1, name: "banner", image: "pokes-banner"))
        .padding()
}
