//
//  Attributed.swift
//  WCGTX
//
//  Created by Admin on 03/02/21.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    class func getAttributedString(fromString string: String) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: string)
    }
    
    func apply(attribute: [NSAttributedString.Key: Any], subString: String)  {
        if let range = self.string.range(of: subString) {
            self.apply(attribute: attribute, onRange: NSRange(range, in: self.string))
        }
    }
    
    func apply(attribute: [NSAttributedString.Key: Any], onRange range: NSRange) {
        if range.location != NSNotFound {
            self.setAttributes(attribute, range: range)
        }
    }
    
    // Underline string
    func underLine(subString: String) {
        if let range = self.string.range(of: subString) {
            self.underLine(onRange: NSRange(range, in: self.string))
        }
    }
    
    // Underline string on given range
    func underLine(onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue],
                           range: onRange)
    }
    
    
    // Apply color on substring
    func apply(color: UIColor, subString: String) {
        
        if let range = self.string.range(of: subString) {
            self.apply(color: color, onRange: NSRange(range, in:self.string))
        }
    }
    
    // Apply color on given range
    func apply(color: UIColor, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.foregroundColor: color],
                           range: onRange)
    }
}
