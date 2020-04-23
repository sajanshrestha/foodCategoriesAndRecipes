//
//  HomeView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem({
                    Image(systemName: "list.bullet")
                    Text("List")
                })
            RecipeList()
                .tabItem({
                    Image(systemName: "waveform.path.ecg")
                    Text("Recipes")
                })
        }
    }
}

#if DEBUG
var database = MockDatabase()
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(database)
    }
}
#endif

