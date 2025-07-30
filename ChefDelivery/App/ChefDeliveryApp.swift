//
//  ChefDeliveryApp.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 27/05/25.
//

import SwiftUI

@main
struct ChefDeliveryApp: App {
    
    @State private var didPassIntro = false
    
    var body: some Scene {
        WindowGroup {
            if didPassIntro {
                TabViewController()
            } else {
                LoginView(didPassIntro: $didPassIntro)
            }
        }
    }
}
