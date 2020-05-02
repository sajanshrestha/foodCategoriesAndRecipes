//
//  UserPreference.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class UserPreference: ObservableObject {
    
    @Published var selectedIngredients = [String]()
    
    @Published var dietFilter: DietFilter
    
    init(dietFilter: DietFilter) {
        self.dietFilter = dietFilter
    }
    
}


struct DietFilter {
    var balanced: Bool
    var vegan: Bool
    var highProtein: Bool
    var sugarConscious: Bool
    var peanutFree: Bool
    var treenutFree: Bool
}
