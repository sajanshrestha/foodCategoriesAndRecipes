//
//  Recipe.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/22/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


struct Response: Codable {
    
    let hits: [RecipeInfo]
}

struct RecipeInfo: Codable {
    let recipe: Recipe
} 

struct Recipe: Identifiable, Codable {
    
    let id = UUID()
    let label: String
    let image: String
    let url: String
    let calories: Double
    let totalTime: Double
    
}
