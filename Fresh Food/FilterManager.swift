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
    
    static func setFilters(_ filter: DietFilter) {
        defaults.set(filter.balanced, forKey: "balanced")
        defaults.set(filter.vegan, forKey: "vegan")
        defaults.set(filter.highProtein, forKey: "highProtein")
        defaults.set(filter.sugarConscious, forKey: "sugarConscious")
        defaults.set(filter.peanutFree, forKey: "peanutFree")
        defaults.set(filter.treenutFree, forKey: "treenutFree")

    }
    
    static func getFilters() -> DietFilter {
        let balanced = defaults.value(forKey: "balanced") as? Bool
        let vegan = defaults.value(forKey: "vegan") as? Bool
        let highProtein = defaults.value(forKey: "highProtein") as? Bool
        let sugarConscious = defaults.value(forKey: "sugarConscious") as? Bool
        let peanutFree = defaults.value(forKey: "peanutFree") as? Bool
        let treenutFree = defaults.value(forKey: "treenutFree") as? Bool

        return DietFilter(
            balanced: balanced ?? false,
            vegan: vegan ?? false,
            highProtein: highProtein ?? false,
            sugarConscious: sugarConscious ?? false,
            peanutFree: peanutFree ?? false,
            treenutFree: treenutFree ?? false
        )
    }

}
