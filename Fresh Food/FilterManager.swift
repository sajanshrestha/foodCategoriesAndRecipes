//
//  FilterManager.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct FilterManager {
    
    private static let defaults = UserDefaults.standard
    
    enum FilterNames: String {
        case balanced
        case vegan
        case highProtein = "high-protein"
        case sugarConscios = "sugar-conscious"
        case peanutFree = "peanut-free"
        case treeNutFree = "tree-nut-free"
    }
    
    static func setFilters(_ filter: Filter) {
        defaults.set(filter.balanced, forKey: FilterNames.balanced.rawValue)
        defaults.set(filter.vegan, forKey: FilterNames.vegan.rawValue)
        defaults.set(filter.highProtein, forKey: FilterNames.highProtein.rawValue)
        defaults.set(filter.sugarConscious, forKey: FilterNames.sugarConscios.rawValue)
        defaults.set(filter.peanutFree, forKey: FilterNames.peanutFree.rawValue)
        defaults.set(filter.treenutFree, forKey: FilterNames.treeNutFree.rawValue)
    }
    
    static func getFilters() -> Filter {
        let balanced = defaults.value(forKey: FilterNames.balanced.rawValue) as? Bool
        let vegan = defaults.value(forKey: FilterNames.vegan.rawValue) as? Bool
        let highProtein = defaults.value(forKey: FilterNames.highProtein.rawValue) as? Bool
        let sugarConscious = defaults.value(forKey: FilterNames.sugarConscios.rawValue) as? Bool
        let peanutFree = defaults.value(forKey: FilterNames.peanutFree.rawValue) as? Bool
        let treenutFree = defaults.value(forKey: FilterNames.treeNutFree.rawValue) as? Bool

        return Filter(
            balanced: balanced ?? false,
            vegan: vegan ?? false,
            highProtein: highProtein ?? false,
            sugarConscious: sugarConscious ?? false,
            peanutFree: peanutFree ?? false,
            treenutFree: treenutFree ?? false
        )
    }
}
