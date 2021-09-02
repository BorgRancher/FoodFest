//
//  FoodsManager.swift
//  FoodFest
//
//  Created by Takasur Azeem on 25/08/2021.
//

import Foundation

class FoodsManager {
    
    private var foodsToTryArray = [Food]()
    var foodsToTryCount: Int {
        foodsToTryArray.count
    }
    
    var foodsTriedArray = [Food]()
    var foodsTriedCount: Int {
        foodsTriedArray.count
    }
    
    func addFoodToTry(food: Food) {
        if !foodsToTryArray.contains(food) {
            foodsToTryArray.append(food)
        }
    }
    
    func foodToTryAtIndex(index: Int) -> Food {
        return foodsToTryArray[index]
    }
    
    func foodTriedAtIndex(index: Int) -> Food {
        return foodsTriedArray[index]
    }
    
    func checkOffFoodAtIndex(index: Int) {
        foodsTriedArray.append(foodsToTryArray.remove(at: index))
    }
    
    func clearArrays() {
        foodsTriedArray.removeAll()
        foodsToTryArray.removeAll()
    }
    
}
