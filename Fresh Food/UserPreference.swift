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
    
    @Published var filter: Filter
    
    init(filter: Filter) {
        self.filter = filter
    }
    
}
