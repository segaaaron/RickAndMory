//
//  Extensions.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 11/7/23.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    public static func hexColor (hex:String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return Color(UIColor.gray)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return Color(UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                              alpha: CGFloat(1.0)))
    }
}

extension UIColor {
    func hexColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
