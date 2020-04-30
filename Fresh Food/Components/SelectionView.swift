//
//  SelectionView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/30/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct SelectionView: View {
    
    @Binding var slideSelectionView: Bool
    @Binding var selectedIngredientOne: Int
    @Binding var selectedIngredientTwo: Int

    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var items: FetchedResults<Item>
    
    var body: some View {
        
        let itemNames = items.map {$0.name ?? ""}
        return Form {
            Picker(selection: $selectedIngredientOne, label: Text("Ingredient 1")) {
                ForEach(0 ..< itemNames.count) {
                    Text(itemNames[$0])
                }
            }
            Picker(selection: $selectedIngredientTwo, label: Text("Ingredient 2")) {
                ForEach(0 ..< itemNames.count) {
                    Text(itemNames[$0])
                }
            }
            
        }
        .animation(.spring())
        .offset(x: slideSelectionView ? 0 : UIScreen.main.bounds.width, y: 0)
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(slideSelectionView: .constant(true), selectedIngredientOne: .constant(0), selectedIngredientTwo: .constant(0))
    }
}
