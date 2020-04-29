//
//  DetailView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var item: Item
    
    var body: some View {
        VStack {
            ItemInfoRow(infoTitle: "Item", infoValue: item.name ?? "")
            ItemInfoRow(infoTitle: "Quantity", infoValue: "\(item.quantity)")
            ItemInfoRow(infoTitle: "Date", infoValue: item.purchasedDate!.getMediumFormat())
            
        }
        .padding(.horizontal)
    }
}

#if DEBUG
let item = Item()

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        item.name = "Apple"
        item.quantity = 3
        item.purchasedDate = Date()
        return DetailView(item: item)
    }
}
#endif
