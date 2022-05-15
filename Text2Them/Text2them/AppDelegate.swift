//
//  AppDelegate.swift
//  Text2them
//
//  Created by Admin on 26/04/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)

        // Override point for customization after application launch.
        
        /*self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        let navigationController = UINavigationController.init(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()*/
        
        /*if(UserDefaults.standard.value(forKey: "isLogin") != nil)
        {
            if(UserDefaults.standard.value(forKey: "isLogin") as! String == "true")
            {
                setRootViewController(isTabbar: true)
            }
            else
            
            {
                setRootViewController(isTabbar: false)
            }
        }
        else
        {
            setRootViewController(isTabbar: false)
        }*/
        
        
        FirebaseApp.configure()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
    {
       
    }
}

extension AppDelegate {
    func setRootViewController(isTabbar:Bool)
    {
        if (isTabbar) {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            let navigationController = UINavigationController.init(rootViewController: viewController)
            navigationController.setNavigationBarHidden(true, animated: false)
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.first?.rootViewController = navigationController
            } else {
                self.window?.rootViewController = navigationController
            }
        } else {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "SigninVC") as! SigninVC
            let navigationController = UINavigationController.init(rootViewController: viewController)
            navigationController.setNavigationBarHidden(true, animated: false)
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.first?.rootViewController = navigationController
            } else {
                self.window?.rootViewController = navigationController
            }
        }
    }
}


