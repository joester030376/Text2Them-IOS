//
//  EditProfileVC.swift
//  Text2Them
//
//  Created by mac on 20/04/21.
//

import UIKit
import Alamofire
import SVProgressHUD
import SideMenu
import SDWebImage
import Photos

class EditProfileVC: UIViewController, UITextFieldDelegate, UITextViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var ProfileImgView: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var organizationTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    @IBOutlet weak var CancelBtn: UIButton!
    @IBOutlet weak var SaveBtn: UIButton!
    
    //var countryList = ["hi","hello","three","four","five"]
    //var stateList = ["1","2","3","4","5"]
   // var DataState : GetStateModelModel = GetStateModelModel()
   // var stateList = [StateList]()
  //  var productList = [ProductListModelData]()
    var selectedCountry: String?
    var selectedCountryId: Int?
    var selectedState: String?
    var selectedStateId: Int?
    var currentTextField = UITextField()
    let viewModel : GetProfileViewModel = GetProfileViewModel()
    let viewModelCountry : GetCountryViewModel = GetCountryViewModel()
    let viewModelState : GetStateViewModel = GetStateViewModel()
    let viewModelEditProfileDetail : EditProfileDetailViewModel = EditProfileDetailViewModel()
    let viewModelEditOrganization : EditOrganizationViewModel = EditOrganizationViewModel()
    var CountryData = [CountryList]()
    var StateData = [StateList]()
    var OrganizationId = Int()
    var Email = String()
    var Password = String()
    var OrganizationName = String()
    
    var imagePicker = UIImagePickerController()
    var SelectedImg:UIImage!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        countryTextField.attributedPlaceholder = NSAttributedString(string: "Select country", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//
//        stateTextField.attributedPlaceholder = NSAttributedString(string: "Select state", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//
//
        createPickerView()
        dismissPickerView()
        GetCountryApiCall(Token: Session.token)
        GetStateApiCall(Token: Session.token)
        
        self.profileView.isHidden = true
        
        callGetProfileAPI(UserID: Int(Session.id)!, Token: Session.token)
        countryTextField.delegate = self
        stateTextField.delegate = self
        countryTextField.textColor = UIColor.white
//        self.countryTextField.isEditing = false
//        self.stateTextField.isEditing = false
        self.profileView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.setupUI()
    }
    override func viewWillLayoutSubviews()
    {
        self.profileView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.ProfileImgView.RoundCornerViewLayout()
        self.GradientImgView.AddGradientView()
        self.CancelBtn.RoundCornerViewLayout()
        self.SaveBtn.RoundCornerViewLayout()
    }
    
    func checkValidation() -> String{
        var message = String()
        if firstNameTextField.text == ""
        {
            message = "Please enter FirstName"
        }
        else if lastNameTextField.text == ""
        {
            message = "Please enter LastName"
        }
        else if emailTextField.text == ""
        {
            message = "Please enter email"
        } else if Helper.sharedHelper.validateEmailWithString(emailTextField!.text as! NSString) == false
        {
            message = "Please enter valid email"
        }
        else if passwordTextField.text == ""
        {
            message = "Please enter password"
        }
        else if Helper.sharedHelper.passwordValidation(passwordTextField.text as! NSString) == false
        {
            message = "Please enter valid password"
        }
        else if companyNameTextField.text == ""
        {
            message = "Please enter companyName"
        }
        
        else if descriptionTextField.text == ""
        {
            message = "Please enter description"
        }
        
        else if websiteTextField.text == ""
        {
            message = "Please enter website"
        }
        else if dataTextField.text == ""
        {
            message = "Please enter data purge"
        }
        else if countryTextField.text == ""
        {
            message = "Please enter Country"
        }
        else if stateTextField.text == ""
        {
            message = "Please enter State"
        }
        else if cityTextField.text == ""
        {
            message = "Please enter City"
        }
        else if zipcodeTextField.text == ""
        {
            message = "Please enter Zipcode"
        }
     
        return message
    }
    
    private func setupUI()
    {
        
    }

    @IBAction func ProfileBtn_Clicked(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.CheckPermision(iscamera: true)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.CheckPermision(iscamera: false)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    private func CheckPermision(iscamera:Bool)
    {
        if(iscamera)
        {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            if (status == AVAuthorizationStatus.authorized)
            {
                DispatchQueue.main.async
                {
                    self.getImage(fromSourceType: .camera)
                }
            }
            else if (status == AVAuthorizationStatus.denied)
            {
                self.view?.makeToast("Please allow camera access permission into Setting menu so you could access camera.", duration: TOAST_TIME, position: .bottom)
            }
            else if (status == AVAuthorizationStatus.notDetermined)
            {
                AVCaptureDevice.requestAccess(for: .video) { success in
                    if success {
                        DispatchQueue.main.async
                        {
                            self.getImage(fromSourceType: .camera)
                        }
                        
                    } else {
                        self.view?.makeToast("Please allow camera access permission into Setting menu so you could access camera.", duration: TOAST_TIME, position: .bottom)
                    }
                }
            }
            else if (status == AVAuthorizationStatus.restricted)
            {
                self.view?.makeToast("Sorry, we are unable to proceed your request.", duration: TOAST_TIME, position: .bottom)
            }
        }
        else
        {
            let status = PHPhotoLibrary.authorizationStatus()
            if (status == PHAuthorizationStatus.authorized)
            {
                DispatchQueue.main.async
                {
                    self.getImage(fromSourceType: .photoLibrary)
                }
            }
            else if (status == PHAuthorizationStatus.denied)
            {
                self.view?.makeToast("Please allow photos permission into Setting menu so you could access your photos.", duration: TOAST_TIME, position: .bottom)
            }
            else if (status == PHAuthorizationStatus.notDetermined)
            {
                PHPhotoLibrary.requestAuthorization({ (newStatus) in
                    if (newStatus == PHAuthorizationStatus.authorized)
                    {
                        DispatchQueue.main.async
                        {
                            self.getImage(fromSourceType: .photoLibrary)
                        }
                    }
                    else
                    {
                        self.view?.makeToast("Please allow photos permission into Setting menu so you could access your photos.", duration: TOAST_TIME, position: .bottom)
                    }
                })
            }
            else if (status == PHAuthorizationStatus.restricted)
            {
                self.view?.makeToast("Sorry, we are unable to proceed your request.", duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType)
        {
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = sourceType
            self.imagePicker.mediaTypes = ["public.image"]
            self.imagePicker.allowsEditing = true
            self.imagePicker.modalPresentationStyle = .fullScreen
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        self.dismiss(animated: true) { [weak self] in
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            self?.SelectedImg = image
            self?.ProfileImgView.image = self?.SelectedImg
            self!.updateprofilepictureApi()
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createPickerView()
    {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        countryTextField.inputView = pickerView
        stateTextField.inputView = pickerView
    }
    func dismissPickerView()
    {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        countryTextField.inputAccessoryView = toolBar
        stateTextField.inputAccessoryView = toolBar
    }
    @objc func action()
    {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any)
    {
        
        let errMessage = checkValidation()
            if errMessage == ""{
                EditProfileDetailApiCall(Name: firstNameTextField.text!, LastName: lastNameTextField.text!, Email: emailTextField.text!, Password: passwordTextField.text!, UserID: Int(Session.id)!, Type: 0, Token: Session.token)            }
                else{
                    view?.makeToast(errMessage, duration: TOAST_TIME, position: .bottom)
                }
        
   
       // navigationController?.popViewController(animated: false)
    }
    
    @IBAction func CancelBtn_Clicked(_ sender: UIButton)
    {
        let Obj = ["isEdited":false]
        NotificationCenter.default.post(name: NSNotification.Name("ProfileEdited"), object: Obj)
        self.navigationController?.popViewController(animated: false)
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
    
    
   // textFieldDidBeginEditing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        print(currentTextField)
    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//            guard let text = countryTextField.text, !text.isEmpty else {
//                textField.placeholder = "Select Country"
//
//                return true
//            }
//
//            return true
//        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == countryTextField {
        return CountryData.count
        } else 
        {
            return StateData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if currentTextField == countryTextField {
            return CountryData[row].name // dropdown item
        } else {
            return StateData[row].name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if currentTextField == countryTextField
        {
            selectedCountry = CountryData[row].name // selected item
            countryTextField.text = selectedCountry
            self.selectedCountryId = CountryData[row].id!
        }
        else
        {
        selectedCountry = StateData[row].name
        stateTextField.text = selectedCountry
            self.selectedStateId = StateData[row].id!
        }
    }
}


extension EditProfileVC {
    func callGetProfileAPI(UserID:Int,Token:String) {
        SVProgressHUD.show()
        viewModel.callGetProfileAPI(UserID: UserID, Token: Token) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            let status = data?.status ?? (0 != 0)//["status"] as! Int
            if status == true {
                self.profileView.isHidden = false
                
                firstNameTextField.text = data?.data?.name
                lastNameTextField.text = data?.data?.lastName
                emailTextField.text = data?.data?.email
                passwordTextField.text = data?.data?.password
                companyNameTextField.text = data?.data?.organizationName
                descriptionTextField.text = data?.data?.description
                websiteTextField.text = data?.data?.website
                dataTextField.text = data?.data?.datapurge
                countryTextField.text = data?.data?.countryName
                if let strStateName = data?.data?.stateName {
                    stateTextField.text = strStateName.trimmingCharacters(in: .whitespacesAndNewlines)
                }
                cityTextField.text = data?.data?.city
                zipcodeTextField.text = data?.data?.zipCode
                if let img = data?.data?.profileImage
                {
                    ProfileImgView.sd_setShowActivityIndicatorView(true)
                    ProfileImgView.sd_setIndicatorStyle(.medium)
                    ProfileImgView.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "Group 180"), options: SDWebImageOptions(rawValue: 0))
                }
                else
                {
                    ProfileImgView.image = UIImage(named: "Group 180")
                }
            }
            else
            {
                self.view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
}







extension EditProfileVC {
    
    func GetCountryApiCall(Token:String){
        
    /*    let parameter:Parameters = [
            "Token":Session.token
            ]
        SVProgressHUD.show()
        print(parameter)
        let todosEndpoint: String = "http://text2thembackend.sigmasolve.net/api/Account/GetCountry"
        
        AF.request(todosEndpoint, method:.post, parameters: parameter,encoding:  URLEncoding.default,
                   headers: nil)
            .responseJSON { [weak self] response in
                SVProgressHUD.dismiss()
                print(response)
                //     if response.result.isSuccess{
                //            let json = response.result.value as? NSDictionary
                if let JSON = response.value as? NSDictionary{
                    print(JSON)
      
              //      guard let weakSelf = self else { return }
         
                    
                /*    if getModel.status == 1 {
                        self!.preregistrationModeldata = getModel.data
                        self!.userCategoryList = getModel.data.userCategory
                        self!.companyList = getModel.data.companyList
                        self!.userTypeList = getModel.data.userType
                        self!.locationList = getModel.data.locationList
                        USERDEFAULT.set(self!.locationList[0].Name, forKey: "Name")
                        
                        
                        print(getModel)
                        print(getModel.data)
                        // weakSelf.signupData = getModel.data
                    } */
                }
            } */
        
        
        
        viewModelCountry.callGetCountryAPI(Token: Token) { [self] (GetCountryModel, error) in
            CountryData = (GetCountryModel!.data!.countryList)!
        }
        }
    
    
    func GetStateApiCall(Token:String){
        
     /*   let parameter:Parameters = [
            "Token":Session.token
            ]
        SVProgressHUD.show()
        print(parameter)
        let todosEndpoint: String = "http://text2thembackend.sigmasolve.net/api/Account/GetState"
        
        AF.request(todosEndpoint, method:.post, parameters: parameter,encoding:  URLEncoding.default,
                   headers: nil)
            .responseJSON { [weak self] response in
                SVProgressHUD.dismiss()
                print(response)
                //     if response.result.isSuccess{
                //            let json = response.result.value as? NSDictionary
                if let JSON = response.value as? NSDictionary{
                    print(JSON)
      
                    guard let weakSelf = self else { return }
                  //  let getModel = GetStateModel(from: JSON as NSDictionary as! Decoder )
                 //   JSONDecoder().decode(GetStateModel.self, from:JSON as NSDictionary as! Decoder)
                //    print(getModel)
                    
                /*    if getModel.status == 1 {
                        self!.preregistrationModeldata = getModel.data
                        self!.userCategoryList = getModel.data.userCategory
                        self!.companyList = getModel.data.companyList
                        self!.userTypeList = getModel.data.userType
                        self!.locationList = getModel.data.locationList
                        USERDEFAULT.set(self!.locationList[0].Name, forKey: "Name")
                        
                        
                        print(getModel)
                        print(getModel.data)
                        // weakSelf.signupData = getModel.data
                    } */
                }
            } */
      
        
        viewModelState.callGetStateAPI(Token:Token) { [self] (GetStateModel, error) in
            StateData = (GetStateModel!.data!.stateList)!
        }
        }
    func EditProfileDetailApiCall(Name:String,LastName:String,Email:String,Password:String,UserID:Int,Type:Int,Token:String){
        SVProgressHUD.show()
        viewModelEditProfileDetail.callEditProfileDetailAPI(Name: Name, LastName: LastName, Email: Email, Password: Password, UserID: UserID, Type: Type, Token: Token) { [self] (data, error) in
            if data!.status == true{
               // view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                
                EditOrganizationApiCall(OrganizationId: Int(Session.OrganizationId)!, OrganizationName: self.companyNameTextField.text!, Description: self.descriptionTextField.text!, Datapurge: self.dataTextField.text!, website: self.websiteTextField.text!, Country: self.selectedCountryId!, state: self.selectedStateId!, city: cityTextField.text!, ZipCode: self.zipcodeTextField.text!
                                        , UserID: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token)
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func EditOrganizationApiCall(OrganizationId:Int,OrganizationName:String,Description:String,Datapurge:String,website:String,Country:Int,state:Int,city:String,ZipCode:String,UserID:Int,Type:Int,Token:String){
        viewModelEditOrganization.callEditOrganizationAPI(OrganizationId: OrganizationId, OrganizationName: OrganizationName, Description: Description, Datapurge: Datapurge, website: website, Country: Country, state: state, city: city, ZipCode: ZipCode, UserID: UserID, Type: Type, Token: Token) {  [self] (data, error) in
            if data!.status == true{
                SVProgressHUD.dismiss()

                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                                
                let Obj = ["isEdited":true]
                NotificationCenter.default.post(name: NSNotification.Name("ProfileEdited"), object: Obj)
                self.navigationController?.popViewController(animated: false)
            } else {
                SVProgressHUD.dismiss()
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    
    
    func updateprofilepictureApi() {
        
      
        SVProgressHUD.show()
       // Miscellaneous.APPDELEGATE.window!.makeMyToastActivity()
        //        let param = [ "FileName" : "Driving License",                      "B2BId" : 8296] as [String : Any]
        let param = [ "UserId" : Int(Session.id)!] as [String : Any]
       // let firstImage = profileImgView.image!.jpegData(compressionQuality: 0.5)
        let profileImage = ProfileImgView.image!.jpegData(compressionQuality: 0.5)
      //  let secondImage = imageViewBack.image!.jpegData(compressionQuality: 0.5)
        if Reachabilitys.isConnectedToNetwork(){
            AF.upload(multipartFormData: { formData in
                for (key, value) in param {
                    formData.append(("\(value)").data(using: String.Encoding.utf8)!, withName: key)
                }
                formData.append(profileImage!, withName: "files", fileName: "request\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpg")
             //   formData.append(secondImage!, withName: "filestwo", fileName: "secondFile\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpg")
                
            }, to: URL(string: "http://text2thembackend.sigmasolve.net/api/Account/updateprofilepicture")!, usingThreshold: UInt64.init(), method: .post, headers: nil).responseJSON { [] (jsonResponse) in
                print(jsonResponse)
                print(jsonResponse.data!)
              //  print(jsonResponse.result.status)
             //   if jsonResponse.status == true{
                    SVProgressHUD.dismiss()
    //                let res = jsonResponse.result as! NSDictionary
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: jsonResponse.data ?? Data(), options: []) as? [String: Any] {
                        // try to read out a string array
                     //   if data!.status == true{
                        if (json["Status"] != nil) == true {
                        if let names = json["Message"] as? String {
                            print(names)
                            
                            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: names)
                            Miscellaneous.APPDELEGATE.window!.stopMyToastActivity()
                        }
                    } else {
                        Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: (json["Message"] as? String)!)
                        Miscellaneous.APPDELEGATE.window!.stopMyToastActivity()
                     }
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
  
            }
        }else{
            Miscellaneous.APPDELEGATE.window!.stopMyToastActivity()
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            
        }
    }
    


}
