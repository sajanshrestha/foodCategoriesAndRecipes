//
//  NewView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/22/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var url: String
    
    var body: some View {
        let newUrl = self.url.getSecuredURL()
        return WebView(url: newUrl)
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(url: "https://www.seriouseats.com/recipes/2014/02/black-honey-cocktail-cynar-smith-cross-rum-lime-honey-drink-recipe.html")
    }
}

