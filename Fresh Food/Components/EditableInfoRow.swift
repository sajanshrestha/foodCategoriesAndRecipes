//
//  EditableInfoRow.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct EditableInfoRow: View {
    
    var infoTitle: String
    @Binding var infoValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(infoTitle)
                .bold()
                .foregroundColor(.green)
            TextField("", text: $infoValue)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct EditableInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        EditableInfoRow(infoTitle: "Item", infoValue: .constant("Banana"))
    }
}
