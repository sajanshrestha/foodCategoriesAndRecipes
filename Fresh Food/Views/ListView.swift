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
    
    @State private var showAlert = false
       
    @EnvironmentObject var userPreference: UserPreference
    
    @Environment(\.managedObjectContext) var context

    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.name,
                             ascending: true)]) var items: FetchedResults<Item>
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                AddItemView(name: $name, quantity: $quantity)
                
                List {
                    ForEach(items, id: \.self) { item in
                        NavigationLink(destination: DetailView(item: item), label: {
                            ItemRow(item: item)
                        })
                    }.onDelete(perform: delete)
                }
            }
            .navigationBarTitle("Grocery List", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "plus").onTapGesture {
                self.addItem()
            })
            .onAppear {
                let itemNames = self.items.map { $0.name ?? ""}
                
                self.setSelectedIngredietsOnUserDefaults(from: itemNames)

            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Fields Empty"), message: Text("Please Enter Both Name And Quantity"), dismissButton: .default(Text("Ok")))
            })
        }
    }
}

extension ListView {
    
    func addItem() {
        
        guard !name.isEmpty && !quantity.isEmpty else {
            self.showAlert = true
            return
        }
        
        let item = Item(context: self.context)
        item.id = UUID()
        item.name = self.name
        item.quantity = Int16(self.quantity) ?? 0
        item.purchasedDate = Date()
        
        saveItem()

    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            context.delete(item)
        }
        saveItem()
    }
    
    
    func saveItem() {
        do {
            try self.context.save()
        }
        catch {
            print("error saving item!")
        }
        let itemNames = items.map {$0.name ?? ""}
        
        setSelectedIngredietsOnUserDefaults(from: itemNames)

    }
    
    func setSelectedIngredietsOnUserDefaults(from itemNames: [String]) {
        IngredientManager.addSelectedIngredientsToUserDefaults(from: itemNames)
        self.userPreference.selectedIngredients = IngredientManager.selectedIngredients!
    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

