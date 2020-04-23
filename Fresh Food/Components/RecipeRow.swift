//
//  RecipeRow.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct RecipeRow: View {
    
    var recipe: Recipe
    
    @State private var liked = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
            Text(recipe.label)
                .bold()
                .font(.system(.headline, design: .serif))
                .padding()
            
            Image(uiImage: image)
                .resizable()
                .frame(height: 280)
                .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)
            
            
            HStack {
                Text("\(Int(recipe.calories)) calories")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text(recipe.totalTime == 0.0 ? "Time Unknown" : "\(Int(recipe.totalTime)) min")
                    .font(.subheadline)
                    .bold()
            }
            
            NavigationLink(destination: RecipeDetailView(url: recipe.url), label: {
                Text("See Detail")
                    .font(.subheadline)
                    .padding(.bottom)
            })
        }
        .onAppear {
            Client.getImage(url: self.recipe.image) { (image) in
                self.image = image
            }
        }
        
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe(label: "Aalu Paratha", image: "image1", url: "", calories: 200, totalTime: 0.0))
    }
}
