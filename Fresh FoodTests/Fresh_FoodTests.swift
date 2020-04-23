//
//  Fresh_FoodTests.swift
//  Fresh FoodTests
//
//  Created by Sajan Shrestha on 4/19/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import Fresh_Food

class Fresh_FoodTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFoodCategory() throws {
        let item = Item(name: "chicken", quantity: 4, purchasedDate: Date())
        XCTAssertEqual(item.category, Item.FoodCategory.leanMeats)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
