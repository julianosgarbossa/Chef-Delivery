//
//  TabViewController.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 30/07/25.
//

import SwiftUI

struct TabViewController: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label {
                    Text("Home")
                } icon: {
                    Image(systemName: "house")
                }
            }
            
            NavigationStack {
                SearchStoreView(viewModel: SearchStoreViewModel(service: SearchService()))
            }
            .tabItem {
                Label {
                    Text("Busca")
                } icon: {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
        .accessibilityIdentifier("TabViewController")
    }
}

#Preview {
    TabViewController()
}
