//
//  GraphView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/15/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    var body: some View {
        Image("graph")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
