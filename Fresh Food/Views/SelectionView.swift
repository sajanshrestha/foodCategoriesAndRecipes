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
    
    @EnvironmentObject var dietPreference: DietPreference
    
    @State private var success = false
        
    var body: some View {
        ZStack {
            
            Form {
                Section(header: Text("Select Your Ingredients"), content: {
                    
                    
                    Picker(selection: $dietPreference.selectedIngredients[0], label: Text("Ingredient 1"), content: {
                        ForEach(itemNames, id: \.self) { name in
                            Text(name)
                        }
                    })
                    
                    Picker(selection: $dietPreference.selectedIngredients[1], label: Text("Ingredient 2"), content: {
                        ForEach(itemNames, id: \.self) { name in
                            Text(name)
                        }
                    })
                    
                })
                
                Section(header: Text("Health and Allergen Filters"), content: {
                    Toggle(isOn: $dietPreference.filter.balanced, label: {
                        Text("Balanced")
                    })
                    
                    Toggle(isOn: $dietPreference.filter.vegan, label: {
                        Text("Vegan")
                    })
                    Toggle(isOn: $dietPreference.filter.highProtein, label: {
                        Text("High Protein")
                    })
                    
                    Toggle(isOn: $dietPreference.filter.sugarConscious, label: {
                        Text("Sugar Conscious")
                    })
                    Toggle(isOn: $dietPreference.filter.peanutFree, label: {
                        Text("Peanut Free")
                    })
                    
                    Toggle(isOn: $dietPreference.filter.treenutFree, label: {
                        Text("Treenut Free")
                    })
                })
                
                Button("Apply") {
                    self.setFilters()
                    self.setIngredients()
                    self.success = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.success = false
                    }
                }
            }
            
            SuccessIcon(success: $success)
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
        IngredientManager.setUserPickedIngredients(dietPreference.selectedIngredients)
    }
    
    func setFilters() {
        let filter = self.dietPreference.filter
        FilterManager.setFilter(filter)
    }
}


