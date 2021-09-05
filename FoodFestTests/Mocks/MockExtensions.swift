//
//  MockExtensions.swift
//  FoodFestTests
//
//  Created by Takasur Azeem on 03/09/2021.
//

import Foundation
import UIKit

@testable import FoodFest

extension FoodLibraryDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        class func initMock(with dataSource: FoodLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(FoodCellMock.self, forCellReuseIdentifier: "foodCellID")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class FoodCellMock: FoodCell {
        var foodData: Food?
        
        override func configure(food: Food?) {
            self.foodData = food
        }
    }
    
}

extension FoodCellTests {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }
        
        
    }
    
}
