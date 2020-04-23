//
//  ContentView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/19/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State private var name = ""
    @State private var quantity = ""
    
    @EnvironmentObject var database: MockDatabase
    
    var body: some View {
        
        
        let items = database.getItems()
        
        return NavigationView {
            
            VStack {
                
                AddItemView(name: $name, quantity: $quantity)
                
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(item: item), label: {
                            Text(item.name)
                        })
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationBarTitle("Grocery List", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "plus").onTapGesture {
                self.addItem()
                
            })
            
        }
    }
}

extension ListView {
    
    func addItem() {
        guard !name.isEmpty && !quantity.isEmpty else {return}
        let item = Item(name: self.name, quantity: Int(self.quantity) ?? 0, purchasedDate: Date())
        self.database.saveItem(item: item)
        
    }
    
    func delete(at offsets: IndexSet) {
        database.items.remove(atOffsets: offsets)
    }
}



#if DEBUG
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(database)
    }
}
#endif
