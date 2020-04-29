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
    @State private var showOptions = false
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var items: FetchedResults<Item>
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Text("\(selectedIngredients) Recipes").bold().padding().font(.subheadline)
                    Spacer()
                }
                .background(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
                .shadow(radius: 10)
                
                List(recipes) { recipe in
                    RecipeRow(recipe: recipe)
                        .frame(height: 300)
                }
                .navigationBarTitle(Text("Recipes"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showOptions = true
                }, label: {
                    Text("Choose")
                }))
                }.padding()
            .onAppear {
                //self.fetchRecipeList()
            }
        }
    }
}

extension RecipeList {
    
    func getRandomlySelectedNames() -> [String] {
        var itemNames = items.map { $0.name }
        var randomlySelectedItemNames = [String]()
        
        for _ in 1...2 {
            let randomName = itemNames.randomElement() ?? "chicken"
            randomlySelectedItemNames.append(randomName ?? "chicken")
            itemNames.removeAll { $0 == randomName}
        }
        return randomlySelectedItemNames
    }
    
    func fetchRecipeList() {
        
        let randomlySelectedItemNames = self.getRandomlySelectedNames()
        self.selectedIngredients = randomlySelectedItemNames.joined(separator: " and ")
        
        self.recipes = []
        
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
