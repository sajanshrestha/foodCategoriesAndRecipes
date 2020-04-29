//
//  UserPreference.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/29/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import CoreData

struct UserPreference {
    
    private static let defaults = UserDefaults.standard
    
    private static let SELECTED_INGREDIENTS = "selectedIngredients"
    
    // returns the selected item names which is stored in user defaults
    static var selectedIngredients: [String]? {
        return defaults.stringArray(forKey: SELECTED_INGREDIENTS)
    }
    
    static private func setSelectedIngredients(_ itemNames: [String]) {
        defaults.set(itemNames, forKey: SELECTED_INGREDIENTS)
    }
    
    // takes input of item names and set the selected items of the user defaults accordingly
    static func setSelectedIngredients(from itemNames: [String]) {
        
        // if the selected item names in user defaults is nil, select two random names from the list
        if selectedIngredients == nil {
            populateSelectedIngredientsWithRandomNames(from: itemNames)
            
        }
        else {
            checkAndModifySelectedItemNamesIfNeeded(items: itemNames)
        }
    }
    
    private static func checkAndModifySelectedItemNamesIfNeeded(items: [String]) {
        
        var mySelectedIngredients = selectedIngredients!.filter { items.contains($0)}
        
        var itemNames = items
        
        if mySelectedIngredients.count == 1 {
            addOneRandomItemName(to: &mySelectedIngredients, from: &itemNames)
        }
        else if mySelectedIngredients.count == 0 {
            populateSelectedIngredientsWithRandomNames(from: itemNames)
        }
    }
}

extension UserPreference {
    
    static func getRandomItemNamesFromList(items: [String]) -> [String] {
        
        var randomNames = [String]()
        
        var itemNames = items
        
        // first random item
        let randomOne = itemNames.randomElement() ?? "chicken"
        itemNames.removeAll { string in
            string == randomOne
        }
        randomNames.append(randomOne)
        
        // second random item
        let randomTwo = itemNames.randomElement() ?? "bacon"
        randomNames.append(randomTwo)
        return randomNames
        
    }
    
    static func populateSelectedIngredientsWithRandomNames(from itemNames: [String]) {
        let randomItemNames = getRandomItemNamesFromList(items: itemNames)
        setSelectedIngredients(randomItemNames)
    }
    
    static func addOneRandomItemName(to selectedIngredients: inout [String], from itemNames: inout [String]) {
        itemNames.removeAll { string in
            string == selectedIngredients[0]
        }
        selectedIngredients.append(itemNames.randomElement() ?? "chicken")
        setSelectedIngredients(selectedIngredients)
    }
}
