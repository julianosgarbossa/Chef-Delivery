//
//  ChefDeliveryUITests.swift
//  ChefDeliveryUITests
//
//  Created by Juliano Sgarbossa on 05/08/25.
//

import XCTest

final class ChefDeliveryUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        
    }

    @MainActor
    func testRatingFilterButton() {
        let app = XCUIApplication()
        app.launch()
        
        let dragButton = app.images["dragButton"]
        XCTAssertTrue(dragButton.waitForExistence(timeout: 5), "O botão de arraste não foi encontrado")

        // Define o ponto final (por exemplo, 300 pontos à direita)
        let startPoint = dragButton.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let endPoint = startPoint.withOffset(CGVector(dx: 300, dy: 0))

        // Simula o gesto de arrastar
        startPoint.press(forDuration: 0.1, thenDragTo: endPoint)
        
        let homeTab = app.tabBars.buttons["Home"]
        let exists = homeTab.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "A tela inicial não foi carregada corretamente após o gesto de drag.")
        
        let filterMenu = app.buttons["FilterMenu"]
        XCTAssertTrue(filterMenu.exists, "O menu de filtro deve existir")
        filterMenu.tap()
        
        let ratingFilterMenu = app.buttons["RatingFilterButton_3"]
        XCTAssertTrue(ratingFilterMenu.exists, "O botão de filtro 3 estrelas deve existir")
        ratingFilterMenu.tap()
    }
    
    func testRestaurantsOrderFlow() {
        let app = XCUIApplication()
        app.launch()
        
        let dragButton = app.images["dragButton"]
        XCTAssertTrue(dragButton.waitForExistence(timeout: 5), "O botão de arraste não foi encontrado")

        // Define o ponto final (por exemplo, 300 pontos à direita)
        let startPoint = dragButton.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let endPoint = startPoint.withOffset(CGVector(dx: 300, dy: 0))

        // Simula o gesto de arrastar
        startPoint.press(forDuration: 0.1, thenDragTo: endPoint)
        
        let homeTab = app.tabBars.buttons["Home"]
        let exists = homeTab.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "A tela inicial não foi carregada corretamente após o gesto de drag.")
        
        let elementsQuery = app.scrollViews.otherElements
        
        elementsQuery.buttons["Food Court"].swipeUp()
        
        let selectedRestaurant = elementsQuery.staticTexts["Carbron"]
        XCTAssertTrue(selectedRestaurant.exists, "Deve encontrar o restaurante espeficidado no menu de restaurantes")
        selectedRestaurant.tap()
        
        elementsQuery.staticTexts["Picanha grelhada servida com arroz, farofa e vinagrete"].swipeUp()
        
        let selectedProduct = elementsQuery.staticTexts["Maminha grelhada servida com arroz, farofa e vinagrete"]
        XCTAssertTrue(selectedProduct.exists, "Deve encontrar um protudo específico no menu do restaurante")
        selectedProduct.tap()
        
        let sendOrderButton = app.buttons["Enviar pedido"]
        XCTAssertTrue(sendOrderButton.exists, "Deve encontrar o botão para enviar o pedido")
        sendOrderButton.tap()
        
        let confirmOrderButton = app.alerts["Confirmação do Pedido"].buttons["OK"]
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: confirmOrderButton)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed, "Deve encontrar o botão de OK para confirmar o pedido")
        confirmOrderButton.tap()
    }
    
    func testSearchRestaurantByName() {
        let app = XCUIApplication()
        app.launch()
        
        let dragButton = app.images["dragButton"]
        XCTAssertTrue(dragButton.waitForExistence(timeout: 5), "O botão de arraste não foi encontrado")

        // Define o ponto final (por exemplo, 300 pontos à direita)
        let startPoint = dragButton.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let endPoint = startPoint.withOffset(CGVector(dx: 300, dy: 0))

        // Simula o gesto de arrastar
        startPoint.press(forDuration: 0.1, thenDragTo: endPoint)
        
        let homeTab = app.tabBars.buttons["Home"]
        let exists = homeTab.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "A tela inicial não foi carregada corretamente após o gesto de drag.")
        
        let searchTab = app.tabBars["Tab Bar"].buttons["Busca"]
        XCTAssertTrue(searchTab.exists, "Erro ao selecionar a barra de busca")
        searchTab.tap()
                
        let searchField = app.collectionViews.textFields["Pesquisar loja"]
        XCTAssertTrue(searchField.exists, "O campo de texto deve existir")
        searchField.tap()
    
        searchField.typeText("Japonês")
        
        let result = app.collectionViews.staticTexts["Ramen Delícia"]
        XCTAssertTrue(result.exists, "O elemento com nome Ramen Delícia não foi encontrado")
        result.tap()
        
        let cleanSearchBarButton = app/*@START_MENU_TOKEN@*/.buttons["xmark.circle.fill"]/*[[".cells.buttons.firstMatch",".otherElements",".buttons[\"Close\"]",".buttons[\"xmark.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(cleanSearchBarButton.exists, "O botão que limpa a barra de busca não foi encontrado")
        cleanSearchBarButton.tap()
    }
    
    func testSearchForNonExistingName() {
        let app = XCUIApplication()
        app.launch()
        
        let dragButton = app.images["dragButton"]
        XCTAssertTrue(dragButton.waitForExistence(timeout: 5), "O botão de arraste não foi encontrado")

        // Define o ponto final (por exemplo, 300 pontos à direita)
        let startPoint = dragButton.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let endPoint = startPoint.withOffset(CGVector(dx: 300, dy: 0))

        // Simula o gesto de arrastar
        startPoint.press(forDuration: 0.1, thenDragTo: endPoint)
        
        let homeTab = app.tabBars.buttons["Home"]
        let exists = homeTab.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "A tela inicial não foi carregada corretamente após o gesto de drag.")
        
        let searchTab = app.tabBars["Tab Bar"].buttons["Busca"]
        XCTAssertTrue(searchTab.exists, "Erro ao selecionar a barra de busca")
        searchTab.tap()
        
        let searchField = app.collectionViews.textFields["Pesquisar loja"]
        XCTAssertTrue(searchField.exists, "O campo de texto deve existir")
        searchField.tap()
    
        searchField.typeText("Blablabla")
        
        let placeholderImage = app.images["magnifyingglass"]
        XCTAssertTrue(placeholderImage.waitForExistence(timeout: 3), "A imagem de busca não foi encontrada")
        
        let message = app.staticTexts["Nenhuma loja encontrada!"]
        XCTAssertTrue(message.waitForExistence(timeout: 3), "A menssagem de loja não encontrada não foi exibida")
    }
}
