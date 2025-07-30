//
//  SearchStoreViewModelTests.swift
//  ChefDeliveryTests
//
//  Created by Juliano Sgarbossa on 30/07/25.
//

import XCTest
@testable import ChefDelivery

final class SearchStoreViewModelTests: XCTestCase {
    
    // MARK: - Attributes
    var sut: SearchStoreViewModel!
    
    // MARK: - Setup

    override func setUpWithError() throws {
        sut = SearchStoreViewModel(service: SearchService())
    }

    override func tearDownWithError() throws {
        
    }
    
    // MARK: - Unit Tests Methods
    func testFilteredStores() {
        sut.storesType = [
            StoreTypeTwo(id: 1,
                         name: "Tempero Brasil",
                         location: "Benjamin Constant 324 - Passo Fundo RS",
                         stars: 4),
            StoreTypeTwo(id: 2,
                         name: "Sushi do Adão",
                         location: "Independência 732 - Passo Fundo RS",
                         stars: 5),
            StoreTypeTwo(id: 3,
                         name: "Spartano",
                         location: "Paisandú 125 - Passo Fundo RS",
                         stars: 2),
        ]
        
        sut.searchText = "Su"
        
        let filteredStores = sut.filteredStores()
        
        XCTAssertEqual(filteredStores.count, 1)
        XCTAssertEqual(filteredStores[0].name, "Sushi do Adão")
        XCTAssertNotEqual(filteredStores.count, 0)
    }
    
    func testFilteredSoresWithSpecialCharactersInSearchText() {
        sut.storesType = [
            StoreTypeTwo(id: 1,
                         name: "Tempero Brasil",
                         location: "Benjamin Constant 324 - Passo Fundo RS",
                         stars: 4),
            StoreTypeTwo(id: 2,
                         name: "Sushi do Adão",
                         location: "Independência 732 - Passo Fundo RS",
                         stars: 5),
            StoreTypeTwo(id: 3,
                         name: "Spartano",
                         location: "Paisandú 125 - Passo Fundo RS",
                         stars: 2),
        ]
        
        sut.searchText = "!@#$%^&*()"
        
        let filteredStores = sut.filteredStores()
        
        XCTAssertTrue(filteredStores.isEmpty)
        XCTAssertEqual(filteredStores.count, 0)
    }
}
