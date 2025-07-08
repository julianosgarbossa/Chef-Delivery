//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 07/07/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
