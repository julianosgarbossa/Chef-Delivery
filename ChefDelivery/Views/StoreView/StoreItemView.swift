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
            VStack(alignment: .leading, spacing: 5) {
                Text(store.name)
                    .font(.subheadline)
                HStack {
                    ForEach(1...store.stars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
        .background(Color.gray.opacity(0.1))
}
