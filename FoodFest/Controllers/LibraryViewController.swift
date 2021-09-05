//
//  LibraryViewController.swift
//  FoodFest
//
//  Created by Takasur Azeem on 8/25/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    var dataService = FoodLibraryDataService()
    
    var foodManager = FoodsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
        
        dataService.foodManager = foodManager
        dataService.foodManager?.addFood(food: Food(name: "Pizza", restaurant: "Cheese Factory"))
        dataService.foodManager?.addFood(food: Food(name: "Burger", restaurant: "Ranchers"))
        dataService.foodManager?.addFood(food: Food(name: "Loaded Fries"))
        
        libraryTableView.reloadData()
    }
    
    
    
    
}
