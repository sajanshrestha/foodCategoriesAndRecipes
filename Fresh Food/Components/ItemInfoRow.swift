//
//  ItemInfoRow.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ItemInfoRow: View {
    
    var infoTitle: String
    @Binding var infoValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(infoTitle)
                .bold()
                .foregroundColor(.green)
            TextField("", text: $infoValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.custom("Comic Sans MS", size: 20))
                .offset(y: -8)
                .disabled(true)
            
        }
    }
}

struct ItemInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemInfoRow(infoTitle: "Item", infoValue: .constant("Banana"))
    }
}
