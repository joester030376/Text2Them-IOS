//
//  ChangePasswordVC.swift
//  Text2Them
//
//  Created by mac on 20/04/21.
//

import UIKit
import SideMenu

class ChangePasswordVC: UIViewController
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var CurrentPwdTextFieldBgView: UIView!
    @IBOutlet weak var CurrentPwdShowBtn: UIButton!
    @IBOutlet weak var CurrentPwdTextField: UITextField!
    @IBOutlet weak var NewPwdTextFieldBgView: UIView!
    @IBOutlet weak var NewPwdShowBtn: UIButton!
    @IBOutlet weak var NewPwdTextField: UITextField!
    @IBOutlet weak var ConfirmPwdTextFieldBgView: UIView!
    @IBOutlet weak var ConfirmPwdTextField: UITextField!
    @IBOutlet weak var ConfirmPwdShowBtn: UIButton!
    
    @IBOutlet weak var SubmitBtn: UIButton!
    let viewModel : ResetPasswrodViewModel = ResetPasswrodViewModel()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
    }
    private func setupUI()
    {
        self.CurrentPwdShowBtn.tag = 0
        self.NewPwdShowBtn.tag = 0
        self.ConfirmPwdShowBtn.tag = 0
    }
    
    func checkValidation() -> String{
        var message = String()
        if CurrentPwdTextField.text == ""
        {
            message = "Please enter current Password"
        } else if Helper.sharedHelper.passwordValidation(CurrentPwdTextField.text as! NSString) == false
        {
            message = "Please enter valid Password"
            
        }
        else if NewPwdTextField.text == ""
        {
            message = "Please enter new Password"
        }
        else if Helper.sharedHelper.passwordValidation(NewPwdTextField.text as! NSString) == false
        {
            message = "Please enter valid new Password"

        }
        else if ConfirmPwdTextField.text == ""
        {
            message = "Please enter confirm Password"
        }
        else if Helper.sharedHelper.passwordValidation(ConfirmPwdTextField.text as! NSString) == false
        {
            message = "Please enter valid confirm Password"

        }
        return message
    }

    override func viewWillLayoutSubviews()
    {
        self.CurrentPwdTextFieldBgView.RoundCornerViewLayout()
        self.NewPwdTextFieldBgView.RoundCornerViewLayout()
        self.ConfirmPwdTextFieldBgView.RoundCornerViewLayout()
        self.SubmitBtn.RoundCornerViewLayout()
        
        self.GradientImgView.AddGradientView()
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
    
    
    @IBAction func CurrentPwdShowBtn_Clicked(_ sender: UIButton)
    {
        if sender.tag == 0
        {
            sender.tag = 1
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye.slash", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.CurrentPwdTextField.isSecureTextEntry = false
        }
        else
        {
            sender.tag = 0
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.CurrentPwdTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func NewPwdShowBtn_Clicked(_ sender: UIButton)
    {
        if sender.tag == 0
        {
            sender.tag = 1
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye.slash", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.NewPwdTextField.isSecureTextEntry = false
        }
        else
        {
            sender.tag = 0
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.NewPwdTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func ConfirmPwdShowBtn_Clicked(_ sender: UIButton)
    {
        if sender.tag == 0
        {
            sender.tag = 1
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye.slash", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.ConfirmPwdTextField.isSecureTextEntry = false
        }
        else
        {
            sender.tag = 0
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.ConfirmPwdTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
  
        let errMessage = checkValidation()
        if errMessage == ""{
            
       //     LoginApiCall()
            callChangePasswordAPI(OldPassword: CurrentPwdTextField.text!, NewPassword: NewPwdTextField.text!, ConfirmPassword: ConfirmPwdTextField.text!, id: 14)

        }
            else{
                view?.makeToast(errMessage, duration: TOAST_TIME, position: .bottom)
            }
    }
    
}

extension ChangePasswordVC
{
    func callChangePasswordAPI(OldPassword:String,NewPassword:String,ConfirmPassword:String,id:Int) {
        
      //  viewModel.callForgotPasswordAPI(EmailId: emailTextField.text!) { [self] (data, error) in
        viewModel.callResetPasswordAPI(OldPassword: OldPassword, NewPassword: NewPassword, ConfirmPassword: ConfirmPassword, id: id) {[self] (data, error) in
            
        
            let message = data?.message ?? ""//!["message"] as! String
            
            let status = data?.status ?? (0 != 0)//["status"] as! Int
            
            if status == true {
            
        /*    let alertController = UIAlertController(title: "WCGTX", message: message, preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                let vc = MAIN_STORY.instantiateViewController(withIdentifier: "OtpVerificationVC") as! OtpVerificationVC
                self.navigationController?.pushViewController(vc, animated: true)
              /*  let vc = UIStoryboard.init(name: StoryBoardName.VMain, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerIdentifier.VOTP) as? OTPVC
                self.navigationController?.pushViewController(vc!, animated: true) */
            }
            
            alertController.addAction(okAction)
            
            
            // Present the controller
            self.present(alertController, animated: true, completion: nil)  */
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                   
                let vc = MAIN_STORY.instantiateViewController(withIdentifier: "SigninVC") as! SigninVC
                self.navigationController?.pushViewController(vc, animated: true)
                }
            }else {
                self.view?.makeToast(message, duration: TOAST_TIME, position: .bottom)
            }
        }
        
    }
    
}
