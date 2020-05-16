//
//  RecommendationView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/15/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct RecommendationView: View {
    
    @Binding var enteredCharacters: String
    
    @FetchRequest(entity: ItemName.entity(), sortDescriptors: []) var names: FetchedResults<ItemName>
        
    var body: some View {
        
        let fetchedNames = names.map {$0.name ?? ""}
        
        let filteredNames = fetchedNames.filter {$0.hasPrefix(enteredCharacters) && $0.count != enteredCharacters.count}
        
        return VStack(alignment: .leading, spacing: 8) {
            ForEach(filteredNames.indices.count < 3 ? filteredNames.indices : 0..<3, id: \.self) { index in
                Button(action: {
                    self.enteredCharacters = filteredNames[index]
                }, label: {
                    Text(filteredNames[index])
                        .foregroundColor(.green)
                    
                })
            }
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(enteredCharacters: .constant("A"))
    }
}
