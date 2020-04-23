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
            ItemInfoRow(infoTitle: "Item", infoValue: item.name)
            ItemInfoRow(infoTitle: "Quantity", infoValue: "\(item.quantity)")
            ItemInfoRow(infoTitle: "Date", infoValue: item.purchasedDate.getMediumFormat())
            ItemInfoRow(infoTitle: "Category", infoValue: item.category.rawValue)
        }
        .padding(.horizontal)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item(name: "Apple", quantity: 23, purchasedDate: Date()))
    }
}

extension Date {
    func getMediumFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
