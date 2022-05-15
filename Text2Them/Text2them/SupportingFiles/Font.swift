//
//  Font.swift
//  WCGTX
//
//  Created by Admin on 08/02/21.
//

import Foundation
import UIKit


extension UIFont {
    
    static let regular = UIFont(name: "Avenir-Book", size: 15.0)!
    static let loginRegular = UIFont(name: "Avenir-Book", size: 30.0)!
    static let light = UIFont(name: "Avenir-Light ", size: 15.0)
    static let bold = UIFont(name: "Avenir-Black", size: 35.0)!
    static let menuBold = UIFont(name: "Avenir-Black", size: 20.0)!
    static let loginBold = UIFont(name: "Avenir-Black", size: 15.0)!
    
    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size)!
    }
    
    class func light(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }
    
    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Black", size: size)!
    }
    
    class func menuBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Black", size: size)!
    }
    
}
