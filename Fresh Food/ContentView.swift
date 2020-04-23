//
//  ContentView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/19/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    let database = MockDatabase()
    
    var body: some View {
        
        let items = database.getItems()
        
        return NavigationView {
            List(items) { item in
                NavigationLink(destination: Text(item.name), label: {
                    Text(item.name)
                })
            }
        .navigationBarTitle(Text("Grocery List"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
