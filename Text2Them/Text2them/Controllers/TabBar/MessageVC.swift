//
//  MessageVC.swift
//  Text2Them
//
//  Created by mac on 20/04/21.
//

import UIKit
import SideMenu

class MessageVC: UIViewController
{
    @IBOutlet weak var GradientImgView: UIImageView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var btnRecived: UIButton!
    @IBOutlet weak var btnCreateNew: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var recivedContainerView: UIView!
    @IBOutlet weak var createNewContainerView: UIView!
    @IBOutlet weak var sendContainerView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI()
    {
        self.btnRecived.setTitle("Recived", for: .normal)
        self.btnCreateNew.setTitle("Create New", for: .normal)
        self.btnSend.setTitle("Send", for: .normal)
        btnRecived.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnCreateNew.setTitleColor(.black, for: .normal)
        btnSend.setTitleColor(.black, for: .normal)
        btnRecived.backgroundColor = #colorLiteral(red: 0.1672074497, green: 0.3467818499, blue: 0.6603075266, alpha: 1)
        btnCreateNew.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnSend.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewWillLayoutSubviews()
    {
        self.messageView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.GradientImgView.AddGradientView()
    }
    
    @IBAction func actionRecivedButton(_ sender: UIButton)
    {
        btnRecived.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnCreateNew.setTitleColor(.black, for: .normal)
        btnSend.setTitleColor(.black, for: .normal)
        recivedContainerView.isHidden = false
        createNewContainerView.isHidden = true
        sendContainerView.isHidden = true
        btnRecived.backgroundColor = #colorLiteral(red: 0.1672074497, green: 0.3467818499, blue: 0.6603075266, alpha: 1)
        btnCreateNew.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnSend.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func actionCreateNewButton(_ sender: UIButton)
    {
        btnRecived.setTitleColor(.black, for: .normal)
        btnCreateNew.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnSend.setTitleColor(.black, for: .normal)
        recivedContainerView.isHidden = true
        createNewContainerView.isHidden = false
        sendContainerView.isHidden = true
        btnRecived.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnCreateNew.backgroundColor = #colorLiteral(red: 0.1672074497, green: 0.3467818499, blue: 0.6603075266, alpha: 1)
        btnSend.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func actionSendButton(_ sender: UIButton)
    {
        btnRecived.setTitleColor(.black, for: .normal)
        btnCreateNew.setTitleColor(.black, for: .normal)
        btnSend.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        recivedContainerView.isHidden = true
        createNewContainerView.isHidden = true
        sendContainerView.isHidden = false
        btnRecived.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnCreateNew.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnSend.backgroundColor = #colorLiteral(red: 0.1672074497, green: 0.3467818499, blue: 0.6603075266, alpha: 1)
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


