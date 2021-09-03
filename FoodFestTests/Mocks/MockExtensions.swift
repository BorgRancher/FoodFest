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
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
}
