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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCellID", for: indexPath) as! FoodCell
        
        let row = indexPath.row
        let food = indexPath.section == 0 ? foodManager?.foodToTryAtIndex(index: row) : foodManager?.foodTriedAtIndex(index: row)
        
        cell.configure(food: food)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            foodManager?.checkOffFoodAtIndex(index: indexPath.row)
//            tableView.insertRows(at: [indexPath], with: .automatic)
            // FIXME: Do not relaod entire TV
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Foods to Try" : "Foods Tried"
    }
}
