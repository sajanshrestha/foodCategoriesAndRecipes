//
//  RecipeList.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


import SwiftUI

struct RecipeList: View {
    
    @State private var recipes = [Recipe]()
    
    @EnvironmentObject var userPreference: UserPreference
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [], predicate: NSPredicate(format: "quantity > %a", 0)) var items: FetchedResults<Item>
    
    
    var body: some View {
        
        let itemNames = items.map {$0.name ?? ""}
        
        return NavigationView {
            VStack {
                HStack {
                    Text("\(userPreference.selectedIngredients.joined(separator: " and ")) Recipes").bold().padding().font(Font.custom("Comic Sans MS Bold", size: 20))
                    Spacer()
                }
                
                
                List(recipes) { recipe in
                    RecipeRow(recipe: recipe)
                        .frame(height: 300)
                }
                .navigationBarTitle(Text("Recipes"), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: SelectionView(itemNames: itemNames), label: {
                    Text("Customize")
                }))
            }.padding()
                .onAppear {
                    // self.fetchRecipeList()
            }
        }
    }
}

extension RecipeList {
    
    // takes selected ingredients as input and gets the recipe list
    
    func fetchRecipeList() {
        
        self.recipes.removeAll()
        
        Client.getRecipeList(of: userPreference.selectedIngredients, with: userPreference.filter) { (receivedRecipes) in
            self.recipes.append(contentsOf: receivedRecipes)
        }
    }
    
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}


