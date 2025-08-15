//
//  OrderTypeGridViewSnapshotTest.swift
//  ChefDeliveryTests
//
//  Created by Juliano Sgarbossa on 07/08/25.
//

import XCTest
import PreviewSnapshotsTesting

@testable import ChefDelivery
final class OrderTypeGridViewSnapshotTest: XCTestCase {

    override func setUpWithError() throws {
  
    }

    override func tearDownWithError() throws {
    
    }

    func testCompareSnapshotOrderTypeGrid() throws {
        OrderTypeGridView_Previews.snapshots.assertSnapshots()
    }
}
