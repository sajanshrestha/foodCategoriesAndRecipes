//
//  SelectionView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/30/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


 import SwiftUI

 struct SelectionView: View {
    
    @State private var selectedIngredientOne = 0
    @State private var selectedIngredientTwo = 0

    var itemNames: [String]
    
    @EnvironmentObject var userPreference: UserPreference
            
     var body: some View {
         
         Form {
            Section(header: Text("Select Your Ingredients"), content: {
                Picker(selection: $selectedIngredientOne, label: Text("Ingredient 1"), content: {
                    ForEach(0..<itemNames.count, id: \.self) { index in
                        Text(self.itemNames[index])
                    }
                })
                Picker(selection: $selectedIngredientTwo, label: Text("Ingredient 2"), content: {
                    ForEach(0..<itemNames.count, id: \.self) { index in
                        Text(self.itemNames[index])
                    }
                })
            })
            
            Section(header: Text("Health and Allergen Filters"), content: {
                Toggle(isOn: $userPreference.dietFilter.balanced, label: {
                    Text("Balanced")
                })
                
                Toggle(isOn: $userPreference.dietFilter.vegan, label: {
                    Text("Vegan")
                })
                Toggle(isOn: $userPreference.dietFilter.highProtein, label: {
                    Text("High Protein")
                })
                
                Toggle(isOn: $userPreference.dietFilter.sugarConscious, label: {
                    Text("Sugar Conscious")
                })
                Toggle(isOn: $userPreference.dietFilter.peanutFree, label: {
                    Text("Peanut Free")
                })
                
                Toggle(isOn: $userPreference.dietFilter.treenutFree, label: {
                    Text("Treenut Free")
                })
            })
            
            Button("Apply") {
                IngredientManager.setUserPickedIngredients([self.itemNames[self.selectedIngredientOne], self.itemNames[self.selectedIngredientTwo]])
                let filter = self.userPreference.dietFilter
                FilterManager.setFilters(filter)
                
            }
         }
     }
 }

 struct SelectionView_Previews: PreviewProvider {
     static var previews: some View {
         SelectionView(itemNames: [])
     }
 }

 

