//
//  FoodLibraryDataService.swift
//  FoodFest
//
//  Created by Takasur Azeem on 02/09/2021.
//

import UIKit

class FoodLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var foodManager: FoodsManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? foodManager?.foodsToTryCount ?? 0 : foodManager?.foodsTriedCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "foodCellID", for: indexPath)
    }
    
    
}
