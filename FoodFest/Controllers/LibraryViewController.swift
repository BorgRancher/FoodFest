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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
    }
}
