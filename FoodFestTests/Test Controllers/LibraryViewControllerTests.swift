//
//  LibraryViewControllerTests.swift
//  FoodFestTests
//
//  Created by Takasur Azeem on 02/09/2021.
//

import XCTest

@testable import FoodFest
class LibraryViewControllerTests: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as! LibraryViewController)
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Nil Checks
    
    func testLibaryVC_tableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    // MARK: - Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is FoodLibraryDataService)
    }
    
    // MARK: - Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.dataSource is FoodLibraryDataService)
    }
    
    // MARK: - Data Service Assumptions
    
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! FoodLibraryDataService, sut.libraryTableView.delegate as! FoodLibraryDataService)
    }
}
