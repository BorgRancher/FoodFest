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

    // MARK: - Initialization section
    
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
    
    // MARK: - Equatable section
    
    func testEquatable_ReturnsTrue() {
        let food1 = Food(name: "Pizza")
        let food2 = Food(name: "Pizza")
        
        XCTAssertEqual(food1, food2)
    }
    
    
    func testEquatable_ReturnsFalse() {
        let food1 = Food(name: "Pizza")
        let food2 = Food(name: "Burger")
        
        XCTAssertNotEqual(food1, food2)
    }
    
    
}
