//
//  SelectionView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/30/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


import SwiftUI

struct SelectionView: View {
        
    var itemNames: [String]
    
    @EnvironmentObject var userPreference: UserPreference
    
    var body: some View {
        
        Form {
            Section(header: Text("Select Your Ingredients"), content: {
                
                
                Picker(selection: $userPreference.selectedIngredients[0], label: Text("Ingredient 1"), content: {
                    ForEach(itemNames, id: \.self) { name in
                        Text(name)
                    }
                })
                
                Picker(selection: $userPreference.selectedIngredients[1], label: Text("Ingredient 2"), content: {
                    ForEach(itemNames, id: \.self) { name in
                        Text(name)
                    }
                })
                
            })
            
            Section(header: Text("Health and Allergen Filters"), content: {
                Toggle(isOn: $userPreference.filter.balanced, label: {
                    Text("Balanced")
                })
                
                Toggle(isOn: $userPreference.filter.vegan, label: {
                    Text("Vegan")
                })
                Toggle(isOn: $userPreference.filter.highProtein, label: {
                    Text("High Protein")
                })
                
                Toggle(isOn: $userPreference.filter.sugarConscious, label: {
                    Text("Sugar Conscious")
                })
                Toggle(isOn: $userPreference.filter.peanutFree, label: {
                    Text("Peanut Free")
                })
                
                Toggle(isOn: $userPreference.filter.treenutFree, label: {
                    Text("Treenut Free")
                })
            })
            
            
        }
        .onDisappear {
            self.setIngredients()
            self.setFilters()
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(itemNames: [])
    }
}


extension SelectionView {
    
    func setIngredients() {
        IngredientManager.setUserPickedIngredients([userPreference.selectedIngredients[0], userPreference.selectedIngredients[1]])
    }
    
    func setFilters() {
        let filter = self.userPreference.filter
        FilterManager.setFilters(filter)
    }
}


