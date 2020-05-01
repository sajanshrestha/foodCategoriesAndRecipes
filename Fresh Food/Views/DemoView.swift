//
//  RecipeDetailView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/30/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

//import SwiftUI
//
//class DietFilter: ObservableObject {
//    @Published var balanced = true
//    @Published var vegan = true
//    @Published var vegetarian = true
//    @Published var sugarConsious = true
//    @Published var highProtein = true
//    @Published var peanutFree = true
//    @Published var treeNutFree = true
//}
//
//struct DemoView: View {
//    
//    @EnvironmentObject var filter: DietFilter
//
//    @State private var ingredientOne = 0
//    @State private var ingredientTwo = 0
//    
//    var ingredients = ["Apple", "Cherry", "Chicken"]
//
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                
//                Section(header: Text("Pick Upto Two Ingredients")) {
//                    Picker(selection: $ingredientOne, label: Text("Ingredient One")) {
//                        ForEach(0...ingredients.count, id: \.self) { index in
//                            Text(self.ingredients[index])
//                        }
//                    }
//                    Picker(selection: $ingredientTwo, label: Text("Ingredient One")) {
//                        ForEach(0...ingredients.count, id: \.self) { index in
//                            Text(self.ingredients[index])
//                        }
//                    }
//                }
//                Section(header: Text("Health and Allergen Filters")) {
//                    Toggle(isOn: $filter.$balanced, label: {
//                        Text("Balanced")
//                    })
//                    Toggle(isOn: $filter.vegan, label: {
//                        Text("Vegan")
//                    })
//                    
//                    Toggle(isOn: $filter.vegetarian, label: {
//                        Text("Vegetarian")
//                    })
//                    
//                    Toggle(isOn: $filter.sugarConsious, label: {
//                        Text("Sugar Consious")
//                    })
//                    
//                    Toggle(isOn: $filter.highProtein, label: {
//                        Text("High Protein")
//                    })
//                    Toggle(isOn: $filter.peanutFree, label: {
//                        Text("Peanut Free")
//                    })
//                    Toggle(isOn: $filter.treeNutFree, label: {
//                        Text("Tree Nut free")
//                    })
//                }
//            }
//        }
//        
//    }
//}
//
//struct RecipeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoView()
//    }
//}
