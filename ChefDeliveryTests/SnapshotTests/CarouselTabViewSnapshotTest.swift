//
//  CarouselTabViewSnapshotTest.swift
//  ChefDeliveryTests
//
//  Created by Juliano Sgarbossa on 07/08/25.
//

import XCTest
import PreviewSnapshotsTesting

@testable import ChefDelivery
final class CarouselTabViewSnapshotTest: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testCompareSnapshotCarousel() throws {
        CarouselTabView_Previews.snapshots.assertSnapshots()
    }
}
