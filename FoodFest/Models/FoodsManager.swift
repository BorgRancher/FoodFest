//
//  FoodsManager.swift
//  FoodFest
//
//  Created by Takasur Azeem on 25/08/2021.
//

import Foundation

class FoodsManager {
    
    private var foodsToTry = [Food]()
    var foodsToTryCount: Int {
        foodsToTry.count
    }
    
    var foodsTried = [Food]()
    var foodsTriedCount: Int {
        foodsTried.count
    }
    
    func addFoodToTry(food: Food) {
        foodsToTry.append(food)
    }
    
    func foodToTryAtIndex(index: Int) -> Food {
        return foodsToTry[index]
    }
    
    func foodTriedAtIndex(index: Int) -> Food {
        return foodsTried[index]
    }
    
    func checkOffFoodAtIndex(index: Int) {
        foodsTried.append(foodsToTry.remove(at: index))
    }
    
}
