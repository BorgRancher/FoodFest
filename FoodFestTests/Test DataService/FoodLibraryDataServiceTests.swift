//
//  FoodLibraryDataServiceTests.swift
//  FoodFestTests
//
//  Created by Takasur Azeem on 02/09/2021.
//

import XCTest
@testable import FoodFest
class FoodLibraryDataServiceTests: XCTestCase {

    var sut: FoodLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    
    let pizza = Food(name: "Pizza")
    let burger = Food(name: "Burger")
    let fries = Food(name: "Fries")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        libraryVC = (UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "LibraryViewController") as! LibraryViewController)
        _ = libraryVC.view
        
        sut = FoodLibraryDataService()
        sut.foodManager = FoodsManager()
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
        libraryTableView.register(FoodCell.self, forCellReuseIdentifier: "foodCellID")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testTableViewSections_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
        sut.foodManager?.addFood(food: pizza)
        sut.foodManager?.addFood(food: burger)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.foodManager?.addFood(food: fries)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsFoodsTriedCount() {
        sut.foodManager?.addFood(food: pizza)
        sut.foodManager?.addFood(food: burger)
        sut.foodManager?.checkOffFoodAtIndex(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.foodManager?.checkOffFoodAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: - Cells
    func testCells_RowAtIndexPath_ReturnsFoodCell() {
        sut.foodManager?.addFood(food: pizza)
        libraryTableView.reloadData()
        
        let cell = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is FoodCell)
    }
    
    func testCell_ShouldDequeueCell() {
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(FoodCell.self, forCellReuseIdentifier: "foodCellID")
        _ = mock.dequeueReusableCell(withIdentifier: "foodCellID", for: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
}

extension FoodLibraryDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
}
