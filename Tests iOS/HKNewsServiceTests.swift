//
//  HKNewsServiceTests.swift
//  Tests iOS
//
//  Created by Daniel on 28.01.2021.
//

import XCTest
import Combine
@testable import HKN

class HKNewsServiceTests: XCTestCase {
    
    var sut: HKNewsService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HKNewsService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetItems() {
        let exp = expectation(description: "items")
        _ = sut.getItems(in: 0...4, for: "topstories.json")
            .sink { completion in
                print("completed")
            } receiveValue: { values in
                print(values)
                exp.fulfill()
            }
        wait(for: [exp], timeout: 10)
    }
    
}
