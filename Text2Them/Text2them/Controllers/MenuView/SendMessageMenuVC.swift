//
//  SendMessageMenuVC.swift
//  Text2them
//
//  Created by Pratik on 09/07/21.
//

import UIKit
import SideMenu

class SendMessageMenuVC: UIViewController {
    
    @IBOutlet weak var viewFirstName: UIView!
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var viewMobileNUmber: UIView!
    @IBOutlet weak var viewMessage: UIView!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtViewMessage: UITextView!
    
    @IBOutlet weak var GradientImgView: UIImageView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    let viewModelSendMessageFromMenu : SendMessageMenuViewModel = SendMessageMenuViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
        menuRightNavigationController.menuWidth = UIScreen.main.bounds.size.width//300
        menuRightNavigationController.presentationStyle = .menuSlideIn
        menuRightNavigationController.presentationStyle.onTopShadowOpacity = 0.8
        SideMenuManager.default.leftMenuNavigationController = menuRightNavigationController
        GradientImgView.AddGradientView()
        self.txtMobileNumber.maxLength = 10
    }
    
    override func viewWillLayoutSubviews(){
        self.viewFirstName.RoundCornerViewLayout()
        self.viewLastName.RoundCornerViewLayout()
        self.viewMobileNUmber.RoundCornerViewLayout()
        self.viewMessage.layer.cornerRadius = 30
    }
    @IBAction func BackBtnAction(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnMenuClicked(_ sender: Any) {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        if isValidate(){
            sendMessageFromMenu()
        }
    }
    
    func isValidate() -> Bool{
        if txtFirstName.text == ""{
            view?.makeToast(myMessages.KPlease_enter_a_FName, duration: TOAST_TIME, position: .bottom)
            return false
        }else if txtLastName.text == ""{
            view?.makeToast(myMessages.KPlease_enter_a_LName, duration: TOAST_TIME, position: .bottom)
            return false
        }else if txtMobileNumber.text == ""{
            view?.makeToast(myMessages.KPlease_enter_a_phone, duration: TOAST_TIME, position: .bottom)
            return false
        }else if txtViewMessage.text == ""{
            view?.makeToast(myMessages.KPlease_enter_a_Message, duration: TOAST_TIME, position: .bottom)
            return false
        }else{
            return true
        }
    }
}

extension SendMessageMenuVC{
    
    func sendMessageFromMenu(){
        viewModelSendMessageFromMenu.callSendSmsFromMenuAPI(NewMessageFirstName: txtFirstName.text!, NewMessageLastName: txtLastName.text!, NewMessageMobileNo: txtMobileNumber.text!, NewMessageText: txtViewMessage.text!, UserID: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token) { (SendMessageMenuModel, Error) in
            
            if (SendMessageMenuModel?.status)!{
                self.view?.makeToast(SendMessageMenuModel?.message, duration: TOAST_TIME, position: .bottom)
                self.navigationController?.popViewController(animated: false)
            }else{
                self.view?.makeToast(SendMessageMenuModel?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
}
