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
    

    @State private var selectedIngredients = ""
    @State private var selectedIngredientOne = 0
    @State private var selectedIngredientTwo = 0

    @State private var slideSelectionView = false
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var items: FetchedResults<Item>

    
    var body: some View {
        
        let itemNames = items.map {$0.name ?? ""}
        
        return NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("\(selectedIngredients) Recipes").bold().padding().font(Font.custom("Comic Sans MS Bold", size: 20))
                        Spacer()
                    }
                    
                    
                    List(recipes) { recipe in
                        RecipeRow(recipe: recipe)
                            .frame(height: 300)
                    }
                    .navigationBarTitle(Text("Recipes"), displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        if self.slideSelectionView {
                            UserPreference.setUserPickedIngredients([itemNames[self.selectedIngredientOne], itemNames[self.selectedIngredientTwo]])
                            // self.fetchRecipeList()
                        }
                        self.slideSelectionView.toggle()
                        
                    }, label: {
                        Text(slideSelectionView ? "Done": "Change")
                    }))
                }.padding()
                    .onAppear {
                        // self.fetchRecipeList()
                }
                SelectionView(slideSelectionView: $slideSelectionView, selectedIngredientOne: $selectedIngredientOne, selectedIngredientTwo: $selectedIngredientTwo)
            }
        }
    }
}

extension RecipeList {
    
    func fetchRecipeList() {
        
        guard let selectedIngredients = UserPreference.selectedIngredients else {return}
        
        let randomlySelectedItemNames = selectedIngredients
        self.selectedIngredients = randomlySelectedItemNames.joined(separator: " and ")
        
        self.recipes.removeAll()
        
        Client.getRecipeList(of: randomlySelectedItemNames) { (receivedRecipes) in
            self.recipes.append(contentsOf: receivedRecipes)
        }
    }
    
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
