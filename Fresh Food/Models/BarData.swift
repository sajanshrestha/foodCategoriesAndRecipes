//
//  FoodData.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/18/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import UIKit


struct BarData: Identifiable {
    
    let category: FoodCategory
    var percentage: Double
    var id = UUID()
    
    
}


enum FoodCategory: String, CaseIterable {
    
    case proteinFood = "PROTEIN FOODS"
    case fruitsAndVeggies = "FRUITS AND VEGETABLES"
    case dairy = "DAIRY"
    case grain = "GRAINS"
    case other = "OTHER FOODS"
    case beverages = "BEVERAGES"
}
