//
//  TabBarVC.swift
//  Text2Them
//
//  Created by mac on 21/04/21.
//

import UIKit
import SideMenu

class TabBarVC: UITabBarController,UITabBarControllerDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
        menuRightNavigationController.menuWidth = UIScreen.main.bounds.size.width//300
        menuRightNavigationController.presentationStyle = .menuSlideIn
        menuRightNavigationController.presentationStyle.onTopShadowOpacity = 0.8
        SideMenuManager.default.leftMenuNavigationController = menuRightNavigationController
        
        self.delegate = self
        
        /*let Home = HomeVC()
        let Message = MessageVC()
        let Profile = ProfileVC()
        let Users = UsersVC()
        self.viewControllers = [Home, Users, Profile, Profile]
        
        self.selectedViewController = Home
        self.selectedIndex = 0*/
        
        //UIWindow.rootViewController = tabBarController
        
       
        /*let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 16)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)*/

        // Do any additional setup after loading the view.
    }

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if selectedIndex == 0
            {
                /*if self.children.count > 0{
                        let viewControllers:[UIViewController] = self.children
                        for viewContoller in viewControllers{
                            viewContoller.willMove(toParent: nil)
                            viewContoller.view.removeFromSuperview()
                            viewContoller.removeFromParent()
                        }
                    }*/
            }
            else if selectedIndex == 1{
            }
            else{
            }
        
            //Setup parent controller in tabbar with remove all chailed controller
            if (viewController is UINavigationController) {
                let navcontrollers = viewController as? UINavigationController
                //navcontrollers?.popViewController(animated: false)
                
                /*if let window = UIApplication.shared.delegate?.window {
                        if let myTabController = window?.rootViewController as? UITabBarController{
                            myTabController.selectedIndex = selectedIndex!
                            myTabController.selectedViewController = myTabController.viewControllers?[selectedIndex!]
                        }
                    }*/
                self.selectedIndex = selectedIndex!
                navcontrollers?.popToRootViewController(animated: false)
            }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
