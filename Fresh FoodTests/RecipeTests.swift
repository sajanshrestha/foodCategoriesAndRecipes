//
//  RecipeTests.swift
//  Fresh FoodTests
//
//  Created by Sajan Shrestha on 4/29/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import Fresh_Food

class RecipeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Time_AfterFormatted_ShouldBeFormatted() throws {
        // given
        let recipe = Recipe(label: "recipe", image: "", url: "", calories: 0.0, totalTime: 125.0)
        
        // when
        let formattedTime = recipe.formattedTime
        
        // then
        XCTAssertEqual(formattedTime, "2hr 5min")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
