//
//  DataView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/18/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct FoodDistributionView: View {
    
    @FetchRequest(
    entity: Item.entity(),
    sortDescriptors: [
        NSSortDescriptor(keyPath: \Item.name,
                         ascending: true)], predicate: NSPredicate(format: "quantity > %a", 0)) var items: FetchedResults<Item>
    
    var body: some View {
        
        let data = getGraphData()
        
        return VStack {
            GraphView(data: data)
                .frame(width: 280, height: 200)
                .padding()
            
        }
    }
    
    func getGraphData() -> [BarData] {
        
        let categoryCount = getCategoriesCount()
                
        var data = [BarData]()
        
        for (category, totalCount) in categoryCount {
            let percentage = (Double(totalCount) / Double(items.count)) * 100
            data.append(BarData(category: category, percentage: percentage))
        }
        
        return data
    }
    
    func getCategoriesCount() -> [FoodCategory: Int] {
        let categoryAndItemsDictionary = Dictionary(grouping: items, by: {$0.category})
        
        var categoryAndCountDict = [FoodCategory: Int]()
        
        for category in FoodCategory.allCases {
            categoryAndCountDict[category] = categoryAndItemsDictionary[category.rawValue]?.count ?? 0
        }
        return categoryAndCountDict
    }
    
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDistributionView()
    }
}
