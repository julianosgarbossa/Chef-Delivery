//
//  SearchStoreView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 30/07/25.
//

import SwiftUI

struct SearchStoreView: View {
    
    @ObservedObject var viewModel: SearchStoreViewModel
    
    var searchTextView: some View {
        HStack {
            TextField("Pesquisar loja", text: $viewModel.searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .autocorrectionDisabled()
            
            Button {
                self.viewModel.searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.gray)
                    .padding(.trailing, 8)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
    
    var body: some View {
        VStack {
            List {
                searchTextView
                    .listRowSeparator(.hidden)
                
                
                if let filteredStores = try? viewModel.filteredStores() {
                    ForEach(filteredStores, id: \.id) { store in
                        Text(store.name)
                            .font(.subheadline)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                    }
                } else {
                    VStack(alignment: .center) {
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.gray)
                            .padding(.top, 50)
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                        
                        Text("Nenhuma loja encontrada!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.gray)
                            .padding(.top, 10)
                        
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.top, 15)
            .listStyle(PlainListStyle())
            .scrollIndicators(.hidden)
            
            Spacer()
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}

#Preview {
    SearchStoreView(viewModel: SearchStoreViewModel(service: SearchService()))
}
