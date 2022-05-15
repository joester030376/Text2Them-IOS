//
//  Extension.swift
//  Kiosk
//
//  Created by Ajay Sareriya on 02/04/21.
//

import Foundation
import UIKit
import SDWebImage

// MARK: - View -
extension UIView {
    func setCornerRadius(cornerRadius: CGFloat) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = cornerRadius;
            self.clipsToBounds = true;
        }
    }
    func setCornerRadius(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = cornerRadius;
            self.layer.borderWidth = borderWidth;
            self.layer.borderColor = borderColor.cgColor
            self.clipsToBounds = true;
        }
    }
    func makeRounded() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.size.height / 2;
            self.clipsToBounds = true;
        }
    }
    func removeRounded() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = 0;
            self.clipsToBounds = true;
        }
    }
    
    func makeRounded(borderWidth: CGFloat, borderColor: UIColor) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.size.height / 2;
            self.layer.borderWidth = borderWidth;
            self.layer.borderColor = borderColor.cgColor
            self.clipsToBounds = true;
        }
    }
    
    func setTopCornerRadius(msak : CACornerMask = [.layerMinXMinYCorner,.layerMaxXMinYCorner],_ corner : CGFloat = 20)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = corner
        self.layer.maskedCorners = msak
    }
    
    func setBottomCornerRadius(msak : CACornerMask = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner],_ corner : CGFloat = 15)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = corner
        self.layer.maskedCorners = msak
    }
    
    func image() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func setRoundedBorderButton(rectCorner: UIRectCorner, size:CGSize){
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width:size.width, height: size.height))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /*func addShadow(opacity: Float, shadowColor: UIColor, shadowOffset: CGSize, shadowRadius: CGFloat, scale: Bool) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }*/
    
    func addShadowView(width:CGFloat=0, height:CGFloat=0, opacity:Float=0.5, maskToBounds:Bool=false, radius:CGFloat=4) {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = maskToBounds
        
        /*self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = opacity*/
    }
    
    func drawDottedLine() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.hexStringToUIColor(hex: "8492A6").withAlphaComponent(0.4).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [3, 3] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: self.bounds.minX, y: self.bounds.minY), CGPoint(x: self.bounds.maxX, y: self.bounds.minY)])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }

    func setTopShadow()
    {
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
    
    func setIn4SideShadow()
    {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 10)
        self.layer.shadowOpacity = 0.1
    }
    
    func addShadowToButton()
    {
        DispatchQueue.main.async {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            self.layer.shadowOpacity = 3.0
            self.layer.shadowRadius = 3.0
            self.layer.masksToBounds = false
        }
    }
    
    func addShadowToCell()
    {
        DispatchQueue.main.async {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            self.layer.shadowOpacity = 3.0
            self.layer.shadowRadius = 3.0
            self.layer.masksToBounds = false
        }
    }
}

//MARK: - Color
extension UIColor {
    static func hexStringToUIColor (hex:String) -> UIColor {
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

extension AppDelegate {
    
    /*func display_Popup(msg_title : String , msg_desc : String, action_title : String)
    {
        guard let alertMessagePopup = StoryBoards.Popup.instantiateViewController(withIdentifier: "WarningPopupVC") as? WarningPopupVC else {
            return
        }
        alertMessagePopup.modalPresentationStyle = .overCurrentContext
        alertMessagePopup.modalTransitionStyle = .crossDissolve
                
        UIApplication.shared.keyWindow?.rootViewController?.present(alertMessagePopup, animated: true, completion: nil)
    }*/
}

//MARK: - Int extension
extension Int {
    func toString() -> String {
        return String.init(describing: self);
    }
    
    func toTimeInterval() -> TimeInterval {
        return TimeInterval.init(exactly: self)!;
    }
}


//MARK:- Scrollview extension
extension UIScrollView {
    func scrollsToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    func scrollsToTop(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: 0)
        setContentOffset(bottomOffset, animated: animated)
    }
}

//MARK: - UIButton
extension UIButton {
     //UIButton properties
     func btnMultipleLines() {
         titleLabel?.numberOfLines = 0
         titleLabel?.lineBreakMode = .byWordWrapping
         titleLabel?.textAlignment = .center
     }
}

//MARK: - UIViewController
extension String {
    func addEscapeSequence() -> String {
        //        return self.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) ?? self
                    
        let unreserved = "-._~/?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet) ?? self
    }
}

//MARK: - Global Date functions
func getCurrentDate(withFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = withFormat
    let timeZone = TimeZone.current
    dateFormatter.timeZone = timeZone
    return dateFormatter.string(from: Date.init())
}

func getDate(fromStrDate: String, fromFormat: String, toFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = fromFormat
    let timeZone = TimeZone.current
    dateFormatter.timeZone = timeZone
    let fromDate = dateFormatter.date(from: fromStrDate) ?? Date.init()
    dateFormatter.dateFormat = toFormat
    return dateFormatter.string(from: fromDate)
}

func calcTotalDays(withFormat: String, fromDate: String, toDate: String) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = withFormat
    let timeZone = TimeZone.current
    dateFormatter.timeZone = timeZone
    let date1: Date = dateFormatter.date(from: fromDate) ?? Date.init()
    let date2: Date = dateFormatter.date(from: toDate) ?? Date.init()
    let days = daysBetween(start: date1, end: date2)
//    totalDay = String(format: "%d", days+1)
    return days + 1
}

func daysBetween(start: Date, end: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: start, to: end).day!
}

func isSameTwoDates(fromStrDate: String, fromFormat: String, toStrDate: String, toFormat: String) -> Bool {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = fromFormat
    let timeZone = TimeZone.current
    dateFormatter.timeZone = timeZone
    let fromDate = dateFormatter.date(from: fromStrDate) ?? Date.init()
    dateFormatter.dateFormat = toFormat
    let toDate = dateFormatter.date(from: toStrDate) ?? Date.init()
    return (fromDate == toDate)        
}

//MARK:- Image to Base64 and vice versa
func convertImageToBase64String (img: UIImage) -> String {
    guard let imageData = img.jpegData(compressionQuality: 1) else {
        return ""
    }
    return imageData.base64EncodedString()
}

func convertBase64StringToImage (imageBase64String:String) -> UIImage {
    guard let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0)) else {
        return UIImage.init()
    }
//    let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
    guard let image = UIImage(data: imageData) else { return UIImage.init() }
    return image
}



