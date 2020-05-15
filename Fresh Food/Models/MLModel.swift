//
//  MLModel.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/15/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


struct CategoryModel {
    static func categorize(item: Item) -> String? {
        let name = item.name ?? ""
        
        let model = CategoryClassifier_1()
        do {
            let description = try model.prediction(Description: name)
            return description.Group
            
        }
        catch {
            print("error predicting")
            return nil
        }
    }
}
