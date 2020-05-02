//
//  UserPreferenceTests.swift
//  Fresh FoodTests
//
//  Created by Sajan Shrestha on 4/29/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import Fresh_Food

class UserPreferenceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Names_AfterRandomlySelected_ShoudBeUniqueRandomNames() throws {
        let items = ["chicken", "banana", "avocado"]
        let randomNames = IngredientManager.getRandomItemNamesFromList(items: items)
        XCTAssertTrue(randomNames.contains("chicken") || randomNames.contains("banana"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
