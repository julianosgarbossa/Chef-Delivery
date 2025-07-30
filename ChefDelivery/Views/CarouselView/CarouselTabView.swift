//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 27/05/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var currentIndex: Int = 1
    @State private var timer: Timer?
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "banner burguer", image: "barbecue-banner"),
        OrderType(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "banner poke", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach (ordersMock) { mock in
                CarouselItemView(order: mock)
                    .tag(mock.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    if currentIndex >= ordersMock.count {
                        currentIndex = 1
                    } else {
                        currentIndex += 1
                    }
                }
            }
        }
        .onDisappear() {
            timer?.invalidate()
            timer = nil
        }
    }
}

#Preview {
    CarouselTabView()
}
