//
//  GraphView.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/15/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    
    var data: [BarData]
              
    var body: some View {
        
        let tallestGraphPercentage =  data.map {$0.percentage}.sorted().last ?? 0.0
        
        return GeometryReader { geometry in
                        
            ZStack {
                VStack(alignment: .leading, spacing: 30) {
                        HStack(alignment: .firstTextBaseline, spacing: 40) {
                            ForEach(self.data.indices) { index in
                                VStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: CGFloat((1.0/Double(self.data.count))) * geometry.size.width/3, height: CGFloat((self.data[index].percentage / tallestGraphPercentage) * Double(geometry.size.height)))
                                        .foregroundColor(.red)
                                        
                                    
                                    Text(String(self.data[index].category.rawValue.first!))
                                        .frame(height: 30)
                                        .font(.custom("Comic Sans MS Bold", size: 20))
                                    
                                }
                            }
                        }
                    .padding()
                        .background(RoundedRectangle(cornerRadius: 4).foregroundColor(.black).opacity(0.8).offset(y: -54))
                                        
                    
                        VStack(alignment: .leading) {
                            
                            ForEach(self.data.indices) { index in
                                HStack {
                                    Text(String(self.data[index].category.rawValue.first!))
                                    Text("  ---  ")
                                    Text(self.data[index].category.rawValue)
                                }
                            }
                        }
                }
                
                Text("Food Percentages")
                    .rotationEffect(.degrees(-90))
                    .offset(x: -190, y: -90)
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(data: [
            BarData(category: .dairy, percentage: 60),
            BarData(category: .fruitsAndVeggies, percentage: 25),
            BarData(category: .grain, percentage: 25),
            BarData(category: .proteinFood, percentage: 25),
            BarData(category: .other, percentage: 25)
        ])
            .frame(height: 300)
    }
}


  
