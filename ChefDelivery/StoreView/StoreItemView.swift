//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 28/05/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            Text(store.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
        .background(Color.gray.opacity(0.1))
}
