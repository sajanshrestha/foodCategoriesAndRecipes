//
//  BuiltInExtensions.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

extension String {

    // changes http to https in the given url string
    func getSecuredURL() -> String {
        let array = self.split(separator: ":")
        if array[0].last == "s" {
            return self
        }
        return array[0] + "s:" + array[1]
    }
}

extension Date {
    func getMediumFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
