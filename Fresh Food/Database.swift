//
//  Database.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

protocol Database {
    
    func getItems() -> [Item]
    
    func saveItem(item: Item)
    
    func updateItem(item: Item)
    
    func deleteItem(item: Item)
    
}
