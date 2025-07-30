//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 08/07/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    @State private var productQuantity: Int = 1
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var service = HomeService()
    
    var body: some View {
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailButtonView(onButtonPress: {
                Task {
                    await confirmOrder()
                }
            })
        }
        .alert("Confirmação do Pedido", isPresented: $showAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(alertMessage)
        })
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            alertMessage = "\(productQuantity) \(product.name)\n\(result["message"] ?? "Pedido confirmado, mas sem mensagem.")"
            showAlert = true
        } catch  {
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[1].products[2])
}
