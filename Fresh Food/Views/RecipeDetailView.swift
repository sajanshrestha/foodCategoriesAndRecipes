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
    
    var body: some View {
        VStack {
            Image("image1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Fruit Salad")
                .font(.largeTitle)
            List(instructions.indices, id: \.self) { index in
                Text(self.instructions[index])
                    .foregroundColor(index % 2 == 0 ? .blue : .black)
                .bold()
                
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
