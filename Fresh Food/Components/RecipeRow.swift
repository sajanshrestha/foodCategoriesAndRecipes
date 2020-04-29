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
    
    @State private var image = UIImage()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    
                    Text(self.getFormattedTimeDuration(Int(self.recipe.totalTime) ))
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                    
                    Text(self.recipe.label)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    NavigationLink(destination: RecipeDetailView(url: self.recipe.url), label: {
                        Text("See Detail").foregroundColor(.blue).bold()
                    })
                    }.padding().background(Color.black.opacity(0.3)).cornerRadius(10)
            }
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
        RecipeRow(recipe: Recipe(label: "Aalu Paratha", image: "image1", url: "", calories: 200, totalTime: 120.0))
            .frame(height: 300)
    }
}

extension RecipeRow {
    func getFormattedTimeDuration(_ minutes: Int) -> String {
        var result = ""
        
        let hours = minutes / 60
        let minutes = minutes % 60
        
        switch (hours == 0, minutes == 0) {
        case (true, true):
            result = "Time Undetermined"
        case (true, false):
            result = "\(minutes)min"
        case (false, true):
            result = "\(hours)hr"
        default:
            result = "\(hours)hr \(minutes)min"
        }
        
        return result
    }
}
