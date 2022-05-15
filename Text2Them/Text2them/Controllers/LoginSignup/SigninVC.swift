//
//  LoginVC.swift
//  Text2Them
//
//  Created by mac on 19/04/21.
//

import UIKit
import SVProgressHUD

class SigninVC: UIViewController
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var EmailTextFieldBgView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextFieldBgView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ShowPwdBtn: UIButton!
    @IBOutlet weak var pleaseLoginLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var text2ThemLabel: UILabel!
    @IBOutlet weak var SignInBtn: UIButton!

    var viewModel : LoginViewModel = LoginViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
       // devil@yopmail.com
       // Sigma@123

    }
  
    private func setupUI()
    {
        emailTextField.text = "asoneji@sigmasolve.net"
        passwordTextField.text = "Sigma@123"
//        self.ShowPwdBtn.tag = 0
        let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)

        let Img = UIImage(systemName: "eye.slash", withConfiguration: eyeSymbolConfiguration)
        ShowPwdBtn.setImage(Img, for: .normal)
    }
    
    func checkValidation() -> String{
        var message = String()
        if emailTextField.text == ""
        {
            message = "Please enter email"
        }
        else if Helper.sharedHelper.validateEmailWithString(emailTextField.text! as NSString) == false
        {
            message = "Please enter valid email"
        }
        else if passwordTextField.text == ""
        {
            message = "Please enter Password"
        }
        else if Helper.sharedHelper.passwordValidation(passwordTextField.text! as NSString) == false
        {
            message = "Please enter valid Password"
        }
        return message
    }
    
    override func viewWillLayoutSubviews()
    {
        self.EmailTextFieldBgView.RoundCornerViewLayout()
        self.PasswordTextFieldBgView.RoundCornerViewLayout()
        self.SignInBtn.RoundCornerViewLayout()
        
        self.GradientImgView.AddGradientView()
    }
    
    @IBAction func ShowPwdBtn_Clicked(_ sender: UIButton)
    {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.passwordTextField.isSecureTextEntry = false

        } else {
            let eyeSymbolConfiguration = UIImage.SymbolConfiguration(scale: .unspecified)
            let Img = UIImage(systemName: "eye.slash", withConfiguration: eyeSymbolConfiguration)
            sender.setImage(Img, for: .normal)
            self.passwordTextField.isSecureTextEntry = true

        }

    }
    @IBAction func ForgotPasswordButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPwdVC") as! ForgotPwdVC
        self.navigationController?.pushViewController(vc,animated: true)
    }
    @IBAction func LoginButtonAction(_ sender: Any)
    {
        let errMessage = checkValidation()
        if errMessage == ""
        {
            LoginApiCall()
        }
        else
        {
            view?.makeToast(errMessage, duration: TOAST_TIME, position: .bottom)
        }
    }
}

extension SigninVC
{
    func LoginApiCall()
    {
        SVProgressHUD.show()
        viewModel.callLoginAPI(Email: emailTextField.text!, Password: passwordTextField.text!) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data!.status == true
            {
                Session.id =  String(data?.data?.id ?? 0)
                Session.token = String(data?.data?.token ?? "")
                Session.userName = String(data?.data?.userName ?? "")
                Session.profileImage = String(data?.data?.profileImage ?? "")
                Session.type = String(data?.data?.type ?? 0)
                Session.AdminId = String(data?.data?.AdminId ?? 0)
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                /*let vc = MAIN_STORY.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC;
                self.navigationController?.pushViewController(vc, animated: true)*/
                
                UserDefaults.standard.setValue("true", forKey: "isLogin")
                
                (UIApplication.shared.delegate as! AppDelegate).setRootViewController(isTabbar: true)
                
                //AppDelegate().window?.rootViewController = vc
                //(UIApplication.shared.delegate as? AppDelegate)?.changeRootViewController(vc)


                //UIApplication.shared.windows.first?.rootViewController = vc
                
                //let navigationController = UINavigationController.init(rootViewController: vc)
                //UIApplication.shared.windows.first?.rootViewController = navigationController
                
                //Session.companyMobile = data?.companyMobile ?? ""
            }
            else {
                self.view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
}
