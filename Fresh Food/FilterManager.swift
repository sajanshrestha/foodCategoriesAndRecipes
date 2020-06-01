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
    
    enum DietFilter: String {
        case balanced
        case vegan
        case highProtein = "high-protein"
        case sugarConscios = "sugar-conscious"
        case peanutFree = "peanut-free"
        case treeNutFree = "tree-nut-free"
    }
    
    static func setFilter(_ filter: Filter) {
        defaults.set(filter.balanced, forKey: DietFilter.balanced.rawValue)
        defaults.set(filter.vegan, forKey: DietFilter.vegan.rawValue)
        defaults.set(filter.highProtein, forKey: DietFilter.highProtein.rawValue)
        defaults.set(filter.sugarConscious, forKey: DietFilter.sugarConscios.rawValue)
        defaults.set(filter.peanutFree, forKey: DietFilter.peanutFree.rawValue)
        defaults.set(filter.treenutFree, forKey: DietFilter.treeNutFree.rawValue)
    }
    
    static func getFilter() -> Filter {
        let balanced = defaults.value(forKey: DietFilter.balanced.rawValue) as? Bool
        let vegan = defaults.value(forKey: DietFilter.vegan.rawValue) as? Bool
        let highProtein = defaults.value(forKey: DietFilter.highProtein.rawValue) as? Bool
        let sugarConscious = defaults.value(forKey: DietFilter.sugarConscios.rawValue) as? Bool
        let peanutFree = defaults.value(forKey: DietFilter.peanutFree.rawValue) as? Bool
        let treenutFree = defaults.value(forKey: DietFilter.treeNutFree.rawValue) as? Bool

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
