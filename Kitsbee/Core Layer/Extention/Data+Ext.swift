//
//  Data+Ext.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 22/06/2021.
//

import UIKit

extension Date {
    public static func hourFrome1970(_ timelong: Int) -> Int{
        let date = Date(timeIntervalSince1970: TimeInterval(timelong))
        return Calendar.current.component(.hour, from: date)
    }
    public static func hourSecondFrom1970(_ timelong: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(timelong))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
