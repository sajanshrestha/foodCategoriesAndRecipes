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
                            self.setRecipeTitle()
                            //self.fetchRecipeList()
                        }
                        self.slideSelectionView.toggle()
                        
                    }, label: {
                        Text(slideSelectionView ? "Done": "Change")
                    }))
                }.padding()
                    .opacity(slideSelectionView ? 0.3 : 1)
                    .blur(radius: slideSelectionView ? 1 : 0)
                .onAppear {
                        self.setRecipeTitle()
                        //self.fetchRecipeList()
                        self.setUpSelectedIngredientIndex()
                }
                SelectionView(slideSelectionView: $slideSelectionView, selectedIngredientOne: $selectedIngredientOne, selectedIngredientTwo: $selectedIngredientTwo)
            }
        }
    }
}

extension RecipeList {
    
    // takes selected ingredients as input and gets the recipe list
    
    func fetchRecipeList() {
        
        guard let selectedIngredients = UserPreference.selectedIngredients else {return}
        
        self.recipes.removeAll()
        
        Client.getRecipeList(of: selectedIngredients) { (receivedRecipes) in
            self.recipes.append(contentsOf: receivedRecipes)
        }
    }
    
    // takes selected ingredients as input and sets the title concatenating the output
    
    func setRecipeTitle() {
        
        guard let selectedIngredients = UserPreference.selectedIngredients else {return}
        self.selectedIngredients = selectedIngredients.joined(separator: " and ")
    }
    
    func setUpSelectedIngredientIndex() {
        
        let itemNames = items.map {$0.name ?? ""}
        
        guard let selectedIngredients = UserPreference.selectedIngredients else {return}
        
        let indexOne = itemNames.firstIndex { string in
            string == selectedIngredients[0]
        }
        
        let indexTwo = itemNames.firstIndex { string in
            string == selectedIngredients[1]
        }
        
        self.selectedIngredientOne = indexOne ?? 0
        self.selectedIngredientTwo = indexTwo ?? 0


    }
    
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
