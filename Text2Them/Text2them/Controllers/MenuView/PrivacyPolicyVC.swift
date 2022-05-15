//
//  PrivacyPolicyVC.swift
//  Text2Them
//
//  Created by mac on 22/04/21.
//

import UIKit
import SideMenu

class PrivacyPolicyVC: UIViewController
{
    @IBOutlet weak var GradientImgView: UIImageView!
    @IBOutlet weak var privacyView: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    /*override func viewDidDisappear(_ animated: Bool)
    {
        navigationController?.popViewController(animated: false)
    }*/
    override func viewWillLayoutSubviews()
    {
        self.GradientImgView.AddGradientView()
        self.privacyView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    @IBAction func BackBtnAction(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: false)
    }
    @IBAction func MenuButtonAction(_ sender: UIButton)
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
    @IBAction func notificationButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc,animated: false)
    }
}
