//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 27/05/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button("R. Vergueiro, 3185") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview () {
    NavigationBar()
        .padding()
        .background(.gray.opacity(0.1))
}
