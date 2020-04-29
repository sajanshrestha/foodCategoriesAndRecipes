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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .orange, .pink, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .cornerRadius(10)
                .shadow(radius: 10)
                
            HStack {
                Text(item.name ?? "")
                Spacer()
                Text("\(item.quantity)")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(item.quantity <= 3 ? .red : .green)
            }.padding()
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
