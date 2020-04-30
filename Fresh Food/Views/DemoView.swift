//
//  RecipeDetailView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/30/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct DemoView: View {
    
    var instructions = [
        "Cut Fruits",
        "Take a bowl",
        "Decorate bowl with fruits"
    ]
    
    @State private var slideSelectionView = false
    
    var ingredients = ["apple", "bacon", "cheese"]
    @State private var selectedIngredientOne = 0
    @State private var selectedIngredientTwo = 2

    
    var body: some View {
        
        
        ZStack {
            VStack {
                HStack {
                    Text("Recipes")
                    Spacer()
                    Button("Change") {
                        self.slideSelectionView.toggle()
                    }
                }.padding()
                List(instructions.indices, id: \.self) { index in
                    Text(self.instructions[index])
                        .foregroundColor(index % 2 == 0 ? .blue : .black)
                        .bold()
                    
                }
            }
            NavigationView {
                Form {
                    Picker(selection: $selectedIngredientOne, label: Text("Ingredient 1")) {
                        ForEach(0 ..< ingredients.count) {
                            Text(self.ingredients[$0])
                        }
                    }
                    Picker(selection: $selectedIngredientTwo, label: Text("Ingredient 2")) {
                        ForEach(0 ..< ingredients.count) {
                            Text(self.ingredients[$0])
                        }
                    }
                    Button("Submit") {
                        self.slideSelectionView = false
                    }
                    
                }
            }
                .animation(.spring())
                .offset(x: slideSelectionView ? 0 : UIScreen.main.bounds.width, y: 0)
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
