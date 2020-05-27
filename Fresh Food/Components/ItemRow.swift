//
//  ItemRow.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/27/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    
    var item: Item
    
    var body: some View {
        
        HStack {
            Text(item.name ?? "")
                .font(Font.custom("Comic Sans MS", size: 20))
            Spacer()
            Text("\(item.quantity)")
                .font(.subheadline)
                .bold()
                .foregroundColor(.green)
        }
        
    }
}

#if DEBUG
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        item.name = "Apple"
        item.quantity = 12
        item.purchasedDate = Date()
        return ItemRow(item: item)
    }
}
#endif
