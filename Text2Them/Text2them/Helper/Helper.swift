//
//  Helper.swift
//  POTG
//
//  Created by Tejas Dattani on 5/20/17.
//  Copyright © 2017 Lithe. All rights reserved.
//

import Foundation
import UIKit
//import SwiftMessages



@objc class Helper: NSObject{
    
    
    static let sharedHelper = Helper()
    var tabBarController : TabBarVC?
    
    func isUserLoggedIn() -> Bool
    {
        if USERDEFAULT.object(forKey: kUser_Id) != nil
        {
            return true
        }
        return false
    }
    
    
    func logOutUser()
    {
        USERDEFAULT.removeObject(forKey: kUser_Id)
        ////        USERDEFAULT.removeObject(forKey: FIRST_NAME)
        ////        USERDEFAULT.removeObject(forKey: LAST_NAME)
        ////        USERDEFAULT.removeObject(forKey: USER_EMAIL)
        ////        USERDEFAULT.removeObject(forKey: USER_ROLE)
        ////        USERDEFAULT.removeObject(forKey: USER_BANNER)
        USERDEFAULT.removeObject(forKey: "token")
    }
    

    
    
    func validateEmailWithString(_ checkString : NSString) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: checkString)
    }
    func passwordValidation(_ checkPass : NSString) -> Bool
    {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: checkPass)
    }
    
    func ShowAlert(str : String, viewcontroller:UIViewController)
    {
        let alertView = UIAlertController(title: "Message", message: str as String, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewcontroller.navigationController?.present(alertView, animated: true, completion: nil)
    }
    
    func isNetworkAvailable() -> Bool
    {
        let rechability = Reachability()
        
        if (rechability?.isReachable)!
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    //MARK: - popView open the share sheet present view
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    
    //    func showGlobalHUD(title:NSString , view:UIView)
    //    {
    //        let HUD = MBProgressHUD.showAdded(to: view, animated: true)
    //        HUD.label.text = title as String
    //    }
    //
    //    func dismissHUD(view:UIView)
    //    {
    //        MBProgressHUD.hide(for: view, animated: true)
    //    }
    
    //  MARK:  NSUserDefault Handlers
    
    func setDefaultObject(dict : [String : AnyObject], key:String)
    {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: dict)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: key)
    }
    
    //    func getDefaultObjectForKey(key : String) -> [String : AnyObject]
    //    {
    ////        let decoded  = UserDefaults.standard.object(forKey: key) as! Data
    ////        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [String : AnyObject]
    ////        return decodedTeams
    //        let decoded  = UserDefaults.standard.object(forKey: key) as! Data
    //        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [String : AnyObject]
    //        return decodedTeams
    //    }
    
    func generateUniqueStr() -> String
    {
        let date = Date()
        let formater = DateFormatter()
        formater.dateFormat = "dd:MM:yyyy:mm:ss:SSS"
        let DateStr = formater.string(from: date) as String
        return DateStr.replacingOccurrences(of: ":", with: "")
    }
    
    func hideFooterSpace(tableView : UITableView)
    {
        tableView.tableFooterView = UIView.init(frame: .zero)
    }
    
    func convertDate(date : String, dateFormat:DateFormatter) -> String
    {
        dateFormat.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormat.date(from: date)
        dateFormat.dateFormat = "dd-MM-yyyy"
        return date == nil ? "-" : String(format : "%@",dateFormat.string(from: date!))
    }
    
    func setCornerRadiusButton(radius : CGFloat, btn: UIButton)
    {
        btn.layer.cornerRadius = radius
        btn.layer.masksToBounds = true
    }
    
    func goToHome()
    {
        
     
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
      //  let navigation = storyboard.instantiateViewController(withIdentifier: "nav") as! UINavigationController
        let navigation = storyboard.instantiateViewController(withIdentifier: "tab") as! UINavigationController
        APP_DELEGATE.window?.rootViewController = navigation
    }
    

    
    func goToHomeWithMEssage(message:String)
    {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "navTab") as! UINavigationController
        navigation.view.makeToast(message, duration: TOAST_TIME, position: .bottom)
        APP_DELEGATE.window?.rootViewController = navigation
    }
    
    func goToLogin()
    {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let navigation  = storyboard.instantiateViewController(withIdentifier: "loginNav") as! UINavigationController
        APP_DELEGATE.window?.rootViewController = navigation
    }
    
    
    
    
    
    
    
    //------------------------------------------//
    
    class func globalAlert(msg: String) {
        let alertView:UIAlertView = UIAlertView()
        alertView.title = ""
        alertView.message = msg
        alertView.delegate = self
        alertView.addButton(withTitle: "OK")
        
        alertView.show()
    }
    
    class func  isSimulator() -> Bool {
        return TARGET_OS_SIMULATOR != 0
        
    }
    
    // MARK: ===================== MB PROGRESS HUDE ========================== //
   /* class func SHOWHUD(view: UIView)
    {
        AppDelegate.showHUD()
    }
    class func HIDEHUD(view: UIView)
    {
        AppDelegate.hideHUD()
    }*/

    // MARK: ================= Compile Blank String Method ================= //
    class func isBlank (String :String?) -> Bool {
        
        if let string = String {
            return string.isEmpty
        } else {
            
            return true
        }
    }
    
    // MARK: ===================== SET / GET :- STRING ========================== //
    class func setPREF(sValue: String, skye:String) {
        
        UserDefaults.standard.setValue(sValue, forKey: skye)
        UserDefaults.standard.synchronize()
    }
    class func getPREF(skey: String) ->  String {
        return  UserDefaults.standard.value(forKey: skey) as! String
    }
    
    // MARK: ===================== SET / GET :- INTEGER ========================== //
    class func setPREFint(sValue: Int, skye:String) {
        
        UserDefaults.standard.setValue(sValue, forKey: skye
        )
        UserDefaults.standard.synchronize()
    }
    
    class func getPREFint(skey: String) ->  Int {
        return UserDefaults.standard.integer(forKey:skey)
    }
    
    
    class func viewBorder(view: UIView, redius: Int, bWidth: Int, colorv: UIColor) {
        view.layer.cornerRadius = CGFloat(redius)
        view.layer.borderWidth = CGFloat(bWidth)
        view.layer.masksToBounds = true
        view.layer.borderColor  = colorv.cgColor
    }

    
    // MARK: ===================== SET / GET :- NS_MUTABLE_ARRAY ========================== //
    class func setPREFArrayNSMutable(sValue: NSMutableArray, skye:String) {
        
        UserDefaults.standard.setValue(sValue, forKey: skye)
        UserDefaults.standard.synchronize()
    }
    
    class func getPREFArrayNSMutable(skey: String) ->  NSMutableArray {
        return UserDefaults.standard.mutableArrayValue(forKey:skey)
    }
    
    // MARK: ===================== SET / GET :-  NS_ARRAY ========================== //
    class func setPREFArray(sValue: NSArray, skye:String) {
        
        UserDefaults.standard.setValue(sValue, forKey: skye)
        UserDefaults.standard.synchronize()
    }
    class func getPREFArray(skey: String) ->  NSArray {
        return UserDefaults.standard.mutableArrayValue(forKey:skey)
    }
    
    // MARK: ===================== SET / GET :-  NS_DICTIONARY ========================== //
    class func setDic(sValue: NSDictionary, sKye:String){
        
        UserDefaults.standard.setValue(sValue, forKey: sKye)
        UserDefaults.standard.synchronize()
    }
    class func getDic(skey: String) ->  NSDictionary {
        //return UserDefaults.standard.dictionaryWithValues(forKeys: [skey]) as NSDictionary
        return (UserDefaults.standard.dictionary(forKey: skey) as NSDictionary?)!
    }
    
    // MARK: ===================== MESSAGE VIEW (ALERT VIEW) ========================== //
    
/*        class func setAnimateAlert(alertType: String,title:String ,message: String)
        {
            if alertType == "warning"
            {
                let warning = MessageView.viewFromNib(layout: .cardView)
                warning.configureTheme(.warning)
                warning.configureTheme(backgroundColor: UIColor.red, foregroundColor: UIColor.white)
                warning.configureDropShadow()
    
                let iconText = ["🤔", "😳", "🙄", "😶","⚠️"]//.sm_random()!
                warning.configureContent(title: title, body: message, iconText: iconText[4])
                warning.button?.isHidden = true
                var warningConfig = SwiftMessages.defaultConfig
                warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
                SwiftMessages.show(config: warningConfig, view: warning)
            }
            if alertType == "success"
            {
                let warning = MessageView.viewFromNib(layout: .cardView)
                warning.configureTheme(.warning)
                warning.configureDropShadow()
    
                let iconText = ["😄", "😃", "🙂", "😁"].sm_random()!
                warning.configureContent(title: title, body: message, iconText: iconText)
                warning.button?.isHidden = true
                var warningConfig = SwiftMessages.defaultConfig
                warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
                SwiftMessages.show(config: warningConfig, view: warning)
            }
            else if alertType == "error"
            {
                let error = MessageView.viewFromNib(layout: .tabView)
                error.configureTheme(.error)
                error.configureContent(title: title, body: message)
                error.button?.setTitle("Stop", for: .normal)
                SwiftMessages.show(view: error)
            }
            else if alertType == "successCenter"
            {
                let success = MessageView.viewFromNib(layout: .cardView)
                success.configureTheme(.success)
                success.configureDropShadow()
                success.configureContent(title: title, body: message)
                success.button?.isHidden = true
                var successConfig = SwiftMessages.defaultConfig
                successConfig.presentationStyle = .center
                successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
                SwiftMessages.show(config: successConfig, view: success)
    
            }
            else if alertType == "info"
            {
                // from bootom info screen
                let info = MessageView.viewFromNib(layout: .messageView)
                info.configureTheme(.info)
                info.button?.isHidden = true
                info.configureContent(title: title, body: message)
                var infoConfig = SwiftMessages.defaultConfig
                infoConfig.presentationStyle = .bottom
                infoConfig.duration = .seconds(seconds: 1.5)
                SwiftMessages.show(config: infoConfig, view: info)
    
            }
            else if alertType == "status"
            {
                let status = MessageView.viewFromNib(layout: .statusLine)
                status.backgroundView.backgroundColor = UIColor.purple
                status.bodyLabel?.textColor = UIColor.white
                status.configureContent(body: message)
                var statusConfig = SwiftMessages.defaultConfig
                statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
                SwiftMessages.show(config: statusConfig, view: status)
            }
            else if alertType == "status2"
            {
                let status2 = MessageView.viewFromNib(layout: .statusLine)
                status2.backgroundView.backgroundColor = UIColor.orange
                status2.bodyLabel?.textColor = UIColor.white
                status2.configureContent(body: message)
                var status2Config = SwiftMessages.defaultConfig
                status2Config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
                status2Config.preferredStatusBarStyle = .lightContent
                SwiftMessages.show(config: status2Config, view: status2)
            }
        }*/
    
    /*===VIEW ANIMATIONS====*/
    class func viewSlideInFromRightToLeft(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.5
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromRight
        views.layer.add(transition!, forKey: nil)
    }
    class func viewSlideInFromLeftToRight(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.5
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromLeft
        views.layer.add(transition!, forKey: nil)
    }
    class func viewSlideInFromTopToBottom(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.5
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromTop
        views.layer.add(transition!, forKey: nil)
    }
    class func viewSlideInFromBottomToTop(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.5
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromBottom
        views.layer.add(transition!, forKey: nil)
    }
 
    // MARK: ===================== EMAIL_ADDRESS_VALIDATION ========================== //
    class func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }

    // MARK: ===================== CHECK HELPER VALUE IS BLANK OR NOT ========================== //
    class func userAlreadyExist(kUsernameKey: String) -> Bool {
        return UserDefaults.standard.object(forKey: kUsernameKey) != nil
    }
    
    // MARK: ===================== CONVERT DATE FORMATE ========================== //
    class func convertDateFormate(strFromDateFormate: String, strToDateFormate: String, date : String) -> String{
        
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = strFromDateFormate
        let newdate = dateFormate.date(from: date)
        
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: newdate!)
        
        dateFormate.dateFormat = strToDateFormate
        let Date1 = dateFormate.string(from: newdate!)
        
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        return day + " " + Date1
    }
    
    // MARK: ===================== GET CURRENT DATE ========================== //
    class func getCurrentDate() -> String
    {
        var currentdata = String()
        let attendanceDate = Date()
        let attendanceFormatter = DateFormatter()
        attendanceFormatter.dateFormat = "dd/MM/yyyy"
        currentdata = attendanceFormatter.string(from: attendanceDate)
        
        return currentdata
    }
    
    // MARK: ===================== GET CURRENT DATE ========================== //
    class func getCurrentDateFormate(yourFormate:String) -> String
    {
        var currentdata = String()
        let attendanceDate = Date()
        let attendanceFormatter = DateFormatter()
        attendanceFormatter.dateFormat = yourFormate
        currentdata = attendanceFormatter.string(from: attendanceDate)
        
        return currentdata
    }
}

// MARK: ===================== HIDE KEYBOARD ========================== //
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: ===================== RANDOM COLOR ========================== //
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

// MARK: ===================== TIMESTEMP ========================== //
extension Date {
    func getTimeStemp() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

class EdgeInsetLabel: UILabel {
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                left: -textInsets.left,
                bottom: -textInsets.bottom,
                right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}

extension EdgeInsetLabel {
    @IBInspectable
    var leftTextInset: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    var rightTextInset: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }

    @IBInspectable
    var topTextInset: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    var bottomTextInset: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }
}


