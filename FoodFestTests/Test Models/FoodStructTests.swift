//
//  FoodStructTests.swift
//  FoodFestTests
//
//  Created by Takasur Azeem on 8/25/21.
//

import XCTest

@testable import FoodFest

class FoodStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_FoodWithName() {
        let testFood = Food(name: "Pizza")
       
        XCTAssertNotNil(testFood)
        XCTAssertEqual(testFood.name, "Pizza")
    }
    
    func testInit_FoodWithNameAndRestaurantName() {
        let testFood = Food(name: "Pizza", restaurant: "The Cheese Factor")
        
        XCTAssertNotNil(testFood)
        XCTAssertEqual(testFood.restaurant, "The Cheese Factor")
    }
}
