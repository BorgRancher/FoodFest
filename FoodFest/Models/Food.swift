//
//  Food.swift
//  FoodFest
//
//  Created by Takasur Azeem on 8/25/21.
//

import Foundation

struct Food {
    
    let name: String
    let restaurant: String?
    
    init(name: String, restaurant: String? = nil) {
        self.name = name
        self.restaurant = restaurant
    }
    
}

extension Food: Equatable {
    
    static func ==(lhs: Food, rhs: Food) -> Bool {
        lhs.name == rhs.name && lhs.restaurant == rhs.restaurant
    }
    
}
