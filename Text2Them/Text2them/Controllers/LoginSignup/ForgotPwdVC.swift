//
//  ForgotPasswordVC.swift
//  Text2Them
//
//  Created by mac on 19/04/21.
//

import UIKit
import SVProgressHUD

class ForgotPwdVC: UIViewController
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var EmailTextFieldBgView: UIView!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ForgotPwdBtn: UIButton!
    let viewModel : ForgotPasswrodViewModel = ForgotPasswrodViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews()
    {
        self.EmailTextFieldBgView.RoundCornerViewLayout()
        self.ForgotPwdBtn.RoundCornerViewLayout()
        
        self.GradientImgView.AddGradientView()
    }
    
    func checkValidation() -> String{
        var message = String()
        if EmailTextField.text == ""
        {
            message = "Please enter email"
        }
        else if Helper.sharedHelper.validateEmailWithString(EmailTextField.text! as NSString) == false
        {
            message = "Please enter valid email"
        }
     
        return message
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func ForgotPasswordButtonAction(_ sender: Any)
    {

        let errMessage = checkValidation()
        if errMessage == ""
        {
            callForgotAPI(EmailId: EmailTextField.text!)
        }
        else
        {
            view?.makeToast(errMessage, duration: TOAST_TIME, position: .bottom)
        }
    }
}

extension ForgotPwdVC
{
    func callForgotAPI(EmailId:String)
    {
        SVProgressHUD.show()
        viewModel.callForgotPasswordAPI(EmailId: EmailTextField.text!) { [self] (data, error) in
            SVProgressHUD.dismiss()
            
            let message = data?.message ?? ""//!["message"] as! String
            let status = data?.status ?? (0 != 0)//["status"] as! Int
            if status == true
            {
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
                    self.navigationController?.popToRootViewController(animated: true)
                   
//                    let vc = MAIN_STORY.instantiateViewController(withIdentifier: "SigninVC") as! SigninVC
//                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }else {
                self.view?.makeToast(message, duration: TOAST_TIME, position: .bottom)
            }
        }
        
    }
    
}
