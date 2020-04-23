//
//  MockData.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class MockDatabase: Database, ObservableObject {
    
    @Published var items = [Item]()
    
    func getItems() -> [Item] {
        return items
    }
    
    func saveItem(item: Item) {
        items.append(item)
    }
    
    func updateItem(item: Item) {
        print("item updated")
    }
    
    func deleteItem(item: Item) {
        print("item deleted")
    }
    
    
}
