//
//  SearchServiceTests.swift
//  ChefDeliveryTests
//
//  Created by Juliano Sgarbossa on 04/08/25.
//

import XCTest
import Mocker
@testable import ChefDelivery

final class SearchServiceTests: XCTestCase {
    
    // MARK: - Attributes
    var sut: SearchService!
    
    //MARK: - Setup
    override func setUpWithError() throws {
        sut = SearchService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - Class Methods
    func testFetchDataSuccess() async {
        let url = URL(string: "https://private-cf6b5a-chefdelivery30.apiary-mock.com/search")!
        let json = getMock()
        let jsonData = Data(json.utf8)
        let mock = Mock(url: url, contentType: .json, statusCode: 200, data: [.get: jsonData])
        mock.register()
        
        let expectation = XCTestExpectation(description: "Fetch data with success")
        
        do {
            let result = try await sut.fetchData()
            switch result {
            case .success(let stores):
                XCTAssertEqual(stores.count, 18)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        } catch {
            XCTFail("Unexpected error: \(error.localizedDescription).")
        }
        
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    func testFetchDataFailure() async {
        let url = URL(string: "https://private-cf6b5a-chefdelivery30.apiary-mock.com/search")!
        Mock(url: url, statusCode: 500, data: [.get: Data()], requestError: NetworkingError.serverError(500)).register()
        
        let expectation = XCTestExpectation(description: "Fetch data failure")
        
        do {
            let result = try await sut.fetchData()
            switch result {
            case .success(_):
                XCTFail("Expected failure, but got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Erro na requisição: The operation couldn’t be completed. (ChefDelivery.NetworkingError error 3.)")
                expectation.fulfill()
            }
        } catch {
            XCTFail()
        }
        
        await fulfillment(of: [expectation], timeout: 1)
    }
    
}

extension SearchServiceTests {
    func getMock() -> String {
        return """
                    [
                        {
                            "id":1,
                            "name":"Monstro Burger",
                            "location":"Rua Principal, 123, São Paulo, SP",
                            "stars":4,
                            "specialties": [
                                "hamburguer",
                                "lanchonete"
                            ]
                        },
                        {
                            "id":2,
                            "name":"Food Court",
                            "location":"Avenida Secundária, 456, São Paulo, SP",
                            "stars":4,
                            "specialties": [
                                "pizza",
                                "lanchonete"
                            ]
                        },
                        {
                            "id":3,
                            "name":"Carbron",
                            "location":"Rua Terceira, 789, São Paulo, SP",
                            "stars":4,
                            "specialties": [
                                "tacos",
                                "mexicana"
                            ]
                        },
                        {
                            "id": 4,
                            "name": "Casa do Sushi",
                            "location": "Av. dos Sushis, 456, São Paulo, SP",
                            "stars": 4,
                            "specialties": [
                                "sushi",
                                "Japonês"
                            ]
                        },
                        {
                            "id": 5,
                            "name": "Paraíso do Hambúrguer",
                            "location": "Rua das Hamburguerias, 789, São Paulo, SP",
                            "stars": 3,
                            "specialties": [
                                "hambúrgueres",
                                "Americano"
                            ]
                        },
                        {
                            "id": 6,
                            "name": "Sabor da Índia",
                            "location": "Av. das Especiarias, 321, São Paulo, SP",
                            "stars": 5,
                            "specialties": [
                                "Indiana",
                                "curries"
                            ]
                        },
                        {
                            "id": 7,
                            "name": "Bistrô Francês",
                            "location": "Rue de la Baguette, 101, São Paulo, SP",
                            "stars": 2,
                            "specialties": [
                                "Cozinha francesa",
                                "doces"
                            ]
                        },
                        {
                            "id": 8,
                            "name": "La Taqueria",
                            "location": "Calle de los Tacos, 567, São Paulo, SP",
                            "stars": 4,
                            "specialties": [
                                "tacos",
                                "Mexicano"
                            ]
                        },
                        {
                            "id": 9,
                            "name": "O Cantinho da Massa",
                            "location": "Via delle Pasta, 789, São Paulo, SP",
                            "stars": 3,
                            "specialties": [
                                "massa",
                                "Italiano"
                            ]
                        },
                        {
                            "id": 10,
                            "name": "Sabor Tailandês",
                            "location": "Rua Sukhumvit, São Paulo, SP",
                            "stars": 3,
                            "specialties": [
                                "Cozinha tailandesa",
                                "comida apimentada"
                            ]
                        },
                        {
                            "id": 11,
                            "name": "Delícias Vegetarianas",
                            "location": "Rua Verde, São Paulo, SP",
                            "stars": 5,
                            "specialties": [
                                "vegetariano",
                                "vegano"
                            ]
                        },
                        {
                            "id": 12,
                            "name": "Pit de Churrasco",
                            "location": "Rua do Hickory, São Paulo, SP",
                            "stars": 4,
                            "specialties": [
                                "churrasco",
                                "Sulista"
                            ]
                        },
                        {
                            "id": 13,
                            "name": "Sabores Mediterrâneos",
                            "location": "Avenida do Egeu, São Paulo, SP",
                            "stars": 2,
                            "specialties": [
                                "Cozinha mediterrânea",
                                "Grego"
                            ]
                        },
                        {
                            "id": 14,
                            "name": "Casa do Dumpling",
                            "location": "Rua do Dumpling, São Paulo, SP",
                            "stars": 4,
                            "specialties": [
                                "dumplings",
                                "Chinês"
                            ]
                        },
                        {
                            "id": 15,
                            "name": "Supremo Steakhouse",
                            "location": "Rua da Costela, São Paulo, SP",
                            "stars": 2,
                            "specialties": [
                                "bife",
                                "Americano"
                            ]
                        },
                        {
                            "id": 16,
                            "name": "Sensação do Mar",
                            "location": "Rua da Marina, São Paulo, SP",
                            "stars": 3,
                            "specialties": [
                                "frutos do mar",
                                "Australiano"
                            ]
                        },
                        {
                            "id": 17,
                            "name": "Ramen Delícia",
                            "location": "Rua do Ramen, São Paulo, SP",
                            "stars": 4,
                            "specialties": [
                                "ramen",
                                "Japonês"
                            ]
                        },
                        {
                            "id": 18,
                            "name": "Café Parisiense",
                            "location": "Rue du Café, São Paulo, SP",
                            "stars": 5,
                            "specialties": [
                                "café",
                                "doces"
                            ]
                        }
                    ]
            """
    }
}
