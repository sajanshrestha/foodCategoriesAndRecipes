//
//  DetailView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var item: Item
    
    @State private var name = ""
    @State private var quantity = ""
    @State private var date = ""
    @State private var category = ""
    
    @Environment(\.managedObjectContext) var context

    
    var body: some View {
        VStack {
            EditableInfoRow(infoTitle: "Name", infoValue: $name)
            EditableInfoRow(infoTitle: "Quantity", infoValue: $quantity)
            ItemInfoRow(infoTitle: "Category", infoValue: $category)
            ItemInfoRow(infoTitle: "Purchased Date", infoValue: $date)
            
        }
        .onAppear {
            self.name = self.item.name ?? ""
            self.quantity = "\(Int(self.item.quantity))"
            self.date = "\(self.item.purchasedDate?.getMediumFormat() ?? "")"
            self.category = self.item.category ?? ""
        }
        .onDisappear {
            self.updateItem()
        }
        .padding(.horizontal)

    }
}




extension DetailView {
    
    func updateItem() {
        
        let updatedItem = Item(context: self.context)
        updatedItem.name = self.name
        updatedItem.quantity = Int16(self.quantity) ?? Int16(0)
        updatedItem.purchasedDate = self.item.purchasedDate
        updatedItem.category = self.item.category
        
        self.context.delete(self.item)
        
        save()
        
    }
    
    func save() {
        do {
            try self.context.save()
        }
        catch {
            print("error updating")
        }
    }
}

#if DEBUG
let item = Item()

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        item.name = "Apple"
        item.quantity = 3
        item.purchasedDate = Date()
        return DetailView(item: item)
    }
}
#endif
