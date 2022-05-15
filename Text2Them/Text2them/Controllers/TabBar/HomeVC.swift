//
//  HomeVC.swift
//  Text2Them
//
//  Created by mac on 20/04/21.
//

import UIKit
import SideMenu

class HomeVC: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var HomeVCTbl: UITableView!
    
    var arr = ["1","2","3"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
    }
    override func viewWillLayoutSubviews()
    {
        self.GradientImgView.AddGradientView()
    }
    
    func showAlert() {
        var refreshAlert = UIAlertController(title: "", message: "Are you sure you want to logout? ", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true) {
                let domain = Bundle.main.bundleIdentifier!
                   UserDefaults.standard.removePersistentDomain(forName: domain)
                   UserDefaults.standard.synchronize()

               // Helper.goToLogin()
                Helper.sharedHelper.goToLogin()
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    private func setupUI()
    {
       
    }
    
    @IBAction func notificationButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc,animated: false)
    }
    
    @IBAction func MenuButtonAction(_ sender: UIBarButtonItem)
    {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        
        /*let SideMenu = storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        if children.first(where: { String(describing: $0.classForCoder) == "MenuVC" }) == nil
        {
            addChild(SideMenu)
            SideMenu.didMove(toParent: self)
            self.view.addSubview(SideMenu.view)
            SideMenu.view.frame = CGRect(x: -(UIScreen.main.bounds.width), y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            UIView.animate(withDuration: 0.2, animations: {
                SideMenu.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }, completion: { finished in
            })
        }*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeVCTblCell", for: indexPath)as! HomeVCTblCell
        return cell
    }
    
}

extension UIViewController
{
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
}

