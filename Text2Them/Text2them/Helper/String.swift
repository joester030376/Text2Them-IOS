//
//  String.swift
//  NBCTimekeeping
//
//  Created by keval dattani on 19/06/19.
//  Copyright © 2019 pratik joshi. All rights reserved.
//

import UIKit

extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
    
    func MilageInputFormatting() -> String {
           
           var number: NSNumber!
           let formatter = NumberFormatter()
           formatter.numberStyle = .currencyAccounting
           formatter.currencySymbol = ""
           formatter.maximumFractionDigits = 2
           formatter.minimumFractionDigits = 2
           
           var amountWithPrefix = self
           
           // remove from String: "$", ".", ","
           let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
           amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
           
           let double = (amountWithPrefix as NSString).doubleValue
           number = NSNumber(value: (double / 100))
           
           // if first number is 0 or all numbers were deleted
           guard number != 0 as NSNumber else {
               return ""
           }
           
           return formatter.string(from: number)!
       }
}

import UIKit

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}
