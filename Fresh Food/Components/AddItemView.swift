//
//  AddItemView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    
    @Binding var name: String
    @Binding var quantity: String
    
    var body: some View {
        VStack {
            TextField("Grocery Item", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.top)
            
            TextField("Quantity", text: $quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(name: .constant("Apple"), quantity: .constant("7"))
    }
}
