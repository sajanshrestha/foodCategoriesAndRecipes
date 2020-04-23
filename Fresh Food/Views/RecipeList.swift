//
//  RecipeList.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    
    @EnvironmentObject var database: MockDatabase
    
    @State private var recipes = [Recipe]()
    
    var body: some View {
        
        NavigationView {
            List(recipes) { recipe in
                RecipeRow(recipe: recipe)
            }
            .navigationBarTitle(Text("Recipes"), displayMode: .inline)
            .onAppear {
                self.fetchRecipeList()
            }
        }
    }
}

extension RecipeList {
    
    func getRandomlySelectedNames() -> [String] {
        var itemNames = self.database.getItems().map { $0.name }
        var randomlySelectedItemNames = [String]()
        
        for _ in 1...3 {
            let randomName = itemNames.randomElement() ?? "chicken"
            randomlySelectedItemNames.append(randomName)
            itemNames.removeAll { $0 == randomName}
        }
        return randomlySelectedItemNames
    }
    
    func fetchRecipeList() {
        let randomlySelectedItemNames = self.getRandomlySelectedNames()
        
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
