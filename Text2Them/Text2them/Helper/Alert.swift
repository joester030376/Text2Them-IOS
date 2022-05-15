//
//  Alert.swift
//  DIOS Transportation
//
//  Created by mac on 12/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit


extension AppDelegate {
    
    func showAlertMessage(messageTitle: NSString, withMessage: NSString) ->Void  {
        OperationQueue.main.addOperation {
            
            let alertController = UIAlertController(title: messageTitle as String, message: withMessage as String, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
                
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "Settings", style: .default) { (action:UIAlertAction!) in
                if let url = URL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.universalOpenUrl(url)
                }
            }
            alertController.addAction(OKAction)
            self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            
        }
    }
    
}



import SystemConfiguration

extension UIColor {
    
    static var appColor = UIColor.white
    
}


extension UIViewController{
    
    func addImageToBackground(image: UIImage)  {
        
        let bgView = UIImageView(image: image)
        bgView.frame = view.bounds
        bgView.contentMode = .scaleAspectFill
        view.backgroundColor = .clear
        view.insertSubview(bgView, at: 0)
        
    }
    
    
    
    func alert(title: String = "",message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}


extension UIApplication {
  
}


@available(iOS 11.0, *)
@available(iOS 11.0, *)
extension UIView {
    
    func roundTopCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        layer.masksToBounds = true
        clipsToBounds = true
        layoutSubviews()
    }
    
    func roundBottomCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        layer.masksToBounds = true
        clipsToBounds = true
        layoutSubviews()
    }
    
    
    func addBottomShadow()  {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        layoutSubviews()
    }
}

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

extension Date {
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
}



public enum ChangeRootViewControllerAnimation {
    case none
    case transitionCrossDissolve
    case transitionFlipFromRight
    case scale
}

extension UIApplication {
    
    public func universalOpenUrl(_ url: URL) {
        if #available(iOS 10, *) {
            open(url, options: [:],
                 completionHandler: {
                    (success) in
                    print("Open \(url): \(success)")
            })
        } else {
            let success = openURL(url)
            print("Open \(url): \(success)")
        }
        
    }
    
    /// Return the specific topViewController in application
    public class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
    
    
    
    public func switchRootViewController(_ window: UIWindow?, rootViewController: UIViewController, animation: ChangeRootViewControllerAnimation, completion: (() -> Void)?) {
        if let window = window {
            
            switch animation {
            case .none:
                window.rootViewController = rootViewController
            case .transitionFlipFromRight:
                UIView.transition(with: window, duration: 0.4, options: .transitionFlipFromRight, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    window.rootViewController = rootViewController
                    UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    completion?()
                })
                
            case .transitionCrossDissolve:
                UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    window.rootViewController = rootViewController
                    UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    completion?()
                })
            case .scale:
                let snapshot: UIView = window.snapshotView(afterScreenUpdates: true)!
                rootViewController.view.addSubview(snapshot);
                
                window.rootViewController = rootViewController;
                
                UIView.animate(withDuration: 0.4, animations: {() in
                    snapshot.layer.opacity = 0;
                    snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
                }, completion: {
                    (value: Bool) in
                    snapshot.removeFromSuperview();
                    completion?()
                })
            }
        }
    }
}


