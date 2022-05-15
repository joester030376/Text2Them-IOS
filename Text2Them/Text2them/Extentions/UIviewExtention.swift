//
//  UIviewExtention.swift
//  Text2them
//
//  Created by Admin on 27/04/21.
//

import Foundation
import UIKit

extension UIView
{
       @IBInspectable
       var cornerRadius: CGFloat {
           get {
               return layer.cornerRadius
           }
           set {
               layer.cornerRadius = newValue
               layer.masksToBounds = newValue > 0
           }
       }
       
       @IBInspectable
       var borderWidth: CGFloat {
           get {
               return layer.borderWidth
           }
           set {
               layer.borderWidth = newValue
           }
       }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat)
    {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
    }
    func RoundCornerViewLayout()
    {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
