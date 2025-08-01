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
        
        sut.storesType = [
            StoreTypeTwo(id: 1,
                         name: "Tempero Brasil",
                         location: "Benjamin Constant 324 - Passo Fundo RS",
                         stars: 4,
                         specialties: ["pizza", "lanchonete"]),
            StoreTypeTwo(id: 2,
                         name: "Sushi do Adão",
                         location: "Independência 732 - Passo Fundo RS",
                         stars: 5,
                         specialties: ["ramen", "japonês"]),
            StoreTypeTwo(id: 3,
                         name: "Spartano",
                         location: "Paisandú 125 - Passo Fundo RS",
                         stars: 2,
                         specialties: ["hamburguer", "lanchonete"])
        ]
    }

    override func tearDownWithError() throws {
        
    }
    
    // MARK: - Unit Tests Methods
    func testFilteredStores() {
        
        var filteredStores: [StoreTypeTwo] = []
        
        sut.searchText = "Su"
        
        do {
            filteredStores = try sut.filteredStores()
            XCTAssertEqual(filteredStores.count, 1)
            XCTAssertEqual(filteredStores[0].name, "Sushi do Adão")
        } catch {
            XCTFail("Failed to search stores")
        }
    }
    
    func testFilteredSoresWithSpecialCharactersInSearchText() {
        
        var filteredStores: [StoreTypeTwo] = []
        
        sut.searchText = "!@#$%"
        
        do {
            filteredStores = try sut.filteredStores()
            XCTFail("Failed to search")
        } catch {
            XCTAssertTrue(filteredStores.isEmpty)
        }
    }
    
    func testFilteredStoresUsingTerm() {
        
        var filteredStores: [StoreTypeTwo] = []
        
        sut.searchText = "pizza"
        
        do {
            filteredStores = try sut.filteredStores()
            XCTAssertEqual(filteredStores.count, 1)
            XCTAssertEqual(filteredStores[0].name, "Tempero Brasil")
        } catch {
            XCTFail("Failed to search")
        }
    }
    
    func testFilteredStoresException() {

        sut.searchText = "xxZZz"
        
        XCTAssertThrowsError(try sut.filteredStores())
    }
}
