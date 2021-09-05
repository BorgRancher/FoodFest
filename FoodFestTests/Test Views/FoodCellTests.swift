//
//  FoodCellTests.swift
//  FoodFestTests
//
//  Created by Takasur Azeem on 06/09/2021.
//

import XCTest

@testable import FoodFest
class FoodCellTests: XCTestCase {

    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as! LibraryViewController
        _ = libraryVC.view
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShoulSetLabelsToFoodData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCellID", for: IndexPath(row: 0, section: 0)) as! FoodCell
        cell.configure(food: Food(name: "Pizza", restaurant: "Cheese Factory"))
        
        XCTAssertEqual(cell.textLabel?.text, "Pizza")
        XCTAssertEqual(cell.detailTextLabel?.text, "Cheese Factory")
    }
}
