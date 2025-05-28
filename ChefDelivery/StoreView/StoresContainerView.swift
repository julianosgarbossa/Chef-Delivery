//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 28/05/25.
//

import SwiftUI

let title = "Lojas"

struct StoresContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { mock in
                    StoreItemView(order: mock)
                    
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
        .background(Color.gray.opacity(0.1))
}
