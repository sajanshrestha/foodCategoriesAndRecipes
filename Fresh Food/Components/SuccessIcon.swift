//
//  SuccessIcon.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct SuccessIcon: View {
    
    @Binding var success: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if self.success {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: geometry.size.width / 4, height: geometry.size.width / 4)
                        .foregroundColor(.green)
                        .background(Circle().stroke(lineWidth: 6))
                        .shadow(radius: 2)
                        
                }
            }
        }
            
    }
}

struct SuccessIcon_Previews: PreviewProvider {
    static var previews: some View {
        SuccessIcon(success: .constant(true))
    }
}
