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
        return VStack {
            Picker(selection: $selectedIngredientOne, label: Image(systemName: "1.circle").font(.title)) {
                ForEach(0 ..< itemNames.count) {
                    Text(itemNames[$0])
                        .foregroundColor(.white)
                }
            }.foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.green))
                .padding()
            
            Picker(selection: $selectedIngredientTwo, label: Image(systemName: "2.circle").font(.title)) {
                ForEach(0 ..< itemNames.count) {
                    Text(itemNames[$0])
                        .foregroundColor(.white)
                }
            }.foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.green))
                .padding()
            
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
