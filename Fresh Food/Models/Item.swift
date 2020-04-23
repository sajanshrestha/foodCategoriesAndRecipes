//
//  Item.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/19/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct Item: Identifiable {
    
    enum FoodCategory: String {
        case vegetables = "vegetables and legumes"
        case fruits = "fruits"
        case grainFood = "grain food"
        case leanMeats = "lean meats and poultry"
        case dairy = "dairy"
        case other = "other"
    }
    
    let id = UUID()
    let name: String
    let quantity: Int
    let purchasedDate: Date
    
    var category: FoodCategory {
        switch self.name {
        case let name where Constants.vegetables.contains(name):
            return .vegetables
        case let name where Constants.fruits.contains(name):
            return .fruits
        case let name where Constants.dairies.contains(name):
            return .dairy
        case let name where Constants.grains.contains(name):
            return .grainFood
        case let name where Constants.meats.contains(name):
            return .leanMeats
        default:
            return .other
        }
    }
}
