//
//  ThemeButton.swift
//  BMD
//
//  Created by Admin on 25/01/21.
//

import Foundation
import UIKit

class ThemeButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
     //   self.Setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  self.Setup()
    }
    

}


class ThemeSimpleButton:UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
   //      self.SetupBold()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  self.SetupBold()
    }
    

   /* func SetupBold(fontSize:CGFloat = 15.0) {
        self.backgroundColor = .clear
        self.setTitleColor(ThemeNavTextColor, for: .normal)
        self.titleLabel?.font = UIFont(name: ThemeBoldFontName, size: fontSize)
    } */
    
    func setSelected(){
        self.setTitleColor(ThemeTabSelectedColor, for: .normal)
        self.backgroundColor = ThemeTabUnselectedColor
    }
    
    func setUnselected(){
        self.setTitleColor(ThemeTabUnselectedColor, for: .normal)
        self.backgroundColor = ThemeTabSelectedColor
    }
    
}
