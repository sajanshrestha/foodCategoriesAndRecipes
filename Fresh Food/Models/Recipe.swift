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
    let label, image, url: String
    let calories, totalTime: Double
    
    
    var formattedTime: String {
        var result = ""
        
        let hours = Int(self.totalTime) / 60
        let minutes = Int(self.totalTime) % 60
        
        switch (hours == 0, minutes == 0) {
        case (true, true):
            result = "Time Undetermined"
        case (true, false):
            result = "\(minutes)min"
        case (false, true):
            result = "\(hours)hr"
        default:
            result = "\(hours)hr \(minutes)min"
        }
        
        return result
    }
    
}
