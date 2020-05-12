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
    
    var filter: Filter
    
    init() {
        
        self.filter = FilterManager.getFilters()
        
        guard let selectedIngredients = IngredientManager.selectedIngredients else {return}
        self.selectedIngredients = selectedIngredients
    }
}
