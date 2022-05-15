//
//  UIImageViewExtention.swift
//  Text2them
//
//  Created by Admin on 28/04/21.
//

import Foundation
import UIKit
extension UIImageView
{
    func AddGradientView()
    {
        let view = UIView(frame: self.frame)
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor(red: 23/255, green: 88/255, blue: 168/255, alpha: 1).cgColor, UIColor(red: 0/255, green: 12/255, blue: 86/255, alpha: 1).cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }
}
