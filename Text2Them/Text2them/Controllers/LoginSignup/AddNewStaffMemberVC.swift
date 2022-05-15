//
//  AddNewStaffMemberVC.swift
//  Text2them
//
//  Created by mac on 10/05/21.
//

import UIKit
import SideMenu
import SVProgressHUD

class AddNewStaffMemberVC: UIViewController,UITextFieldDelegate, UITextViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var staffMemberView: UIView!
    @IBOutlet weak var GradientImgView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var MobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var workingTimingTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var ipTextField: UITextField!
    @IBOutlet weak var activeBtn: UIButton!
    @IBOutlet weak var deActiveBtn: UIButton!
    var check1 = "active"
    var selectedCountry: String?
    var currentTextField = UITextField()
    let viewModelCountry : GetCountryViewModel = GetCountryViewModel()
    let viewModelState : GetStateViewModel = GetStateViewModel()
    let viewModelDepartment : DepartmentListViewModel = DepartmentListViewModel()
    let viewModelDesignation : DesignationListViewModel = DesignationListViewModel()
    
    var CountryData = [CountryList]()
    var StateData = [StateList]()
    var DepartmentData = [DepartmentList]()
    var designationListData = [DesignationList]()
    var selectedStateId = Int()
    var selectedCountryId = Int()
    var selectedDepartmentId = Int()
    var selectedDesignationId = Int()
    var viewStaffmemberModel : StaffMemberViewViewModel = StaffMemberViewViewModel()
    let viewModelEdit : StaffMemberEditViewModel = StaffMemberEditViewModel()
    let viewModelStaffMemberSave : StaffMemberSaveViewModel = StaffMemberSaveViewModel()
    var staffMemberId = Int()
    var countryId = Int()
    var stateId = Int()
    var departmentid = Int()
    var designationid = Int()
    var check = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        print(staffMemberId)
        print(check)
        StaffMemberViewApiCall(id: staffMemberId)
        dismissPickerView()
        GetCountryApiCall(Token: Session.token)
        GetStateApiCall(Token: Session.token)
        GetDepartmentListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
        GetDesignationListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
        
        countryTextField.delegate = self
        stateTextField.delegate = self
        departmentTextField.delegate = self
        designationTextField.delegate = self
        
        //departmentTextField.addTarget(self, action: #selector(respondsToTf), for: .touchDown)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    /*@objc func respondsToTf()  {
     createPickerView()
     //
     print("you can pop-up the data picker here")
     }*/
    
    func createPickerView()
    {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        countryTextField.inputView = pickerView
        stateTextField.inputView = pickerView
        departmentTextField.inputView = pickerView
        designationTextField.inputView = pickerView
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
        departmentTextField.inputAccessoryView = toolBar
        designationTextField.inputAccessoryView = toolBar
    }
    @objc func action()
    {
        view.endEditing(true)
    }
    
    @IBAction func MenuButtonAction(_ sender: UIButton)
    {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    @IBAction func notificationButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc,animated: false)
    }
    
    @IBAction func SubmitButtonAction(_ sender: Any)
    {
        let errMessage = checkValidation()
        if errMessage == ""{
            if check == "AddNew" {
                GetStaffMemberSaveApiCall(FirstName: firstNameTextField.text!, LastName:  lastNameTextField.text!, Department: selectedDepartmentId, Designation: selectedDesignationId, Mobilenumber: MobileNumberTextField.text!, Email:emailTextField.text!, WorkTimings: workingTimingTextField.text!, Country: countryId, State: stateId, ZipCode: zipcodeTextField.text!, IsUser: true, IP: ipTextField.text!,  CityName: cityTextField.text!, UserID: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token)
            }
            else{
                GetStaffMemberEditApiCall(FirstName: firstNameTextField.text!, LastName:  lastNameTextField.text!, Department: selectedDepartmentId, Designation: selectedDesignationId, Mobilenumber: MobileNumberTextField.text!, Email:emailTextField.text!, WorkTimings: workingTimingTextField.text!, Country: countryId, State: stateId, ZipCode: zipcodeTextField.text!, IsUser: true, IP: ipTextField.text!, id: staffMemberId, CityName: cityTextField.text!, UserID: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token)
            }
        }
        else{
            view?.makeToast(errMessage, duration: TOAST_TIME, position: .bottom)
        }
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
        else if departmentTextField.text == ""
        {
            message = "Please Select Department"
        }
        else if designationTextField.text == ""
        {
            message = "Please Select Designation"
        }
        else if MobileNumberTextField.text == ""
        {
            message = "Please enter MobileNumber"
        }
        else if emailTextField.text == ""
        {
            message = "Please enter email"
        } else if Helper.sharedHelper.validateEmailWithString(emailTextField!.text as! NSString) == false
        {
            message = "Please enter valid email"
        }
        else if workingTimingTextField.text == ""
        {
            message = "Please enter WorkingTiming"
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
        else if ipTextField.text == ""
        {
            message = "Please enter Ip"
        }
        else if activeBtn.isSelected == false && deActiveBtn.isSelected == false
        {
            message = "Please Select Configuration"
        }
        return message
    }
    
    
    override func viewWillLayoutSubviews(){
        self.staffMemberView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.GradientImgView.AddGradientView()
    }
    
    @IBAction func ActionActiveButton(_ sender: UIButton){
        check1 = "active"
        deActiveBtn.isSelected = false
        activeBtn.isSelected = !activeBtn.isSelected
    }
    
    @IBAction func ActionDeActiveButton(_ sender: UIButton){
        check1 = "deactive"
        activeBtn.isSelected = false
        deActiveBtn.isSelected = !deActiveBtn.isSelected
    }
    
    // textFieldDidBeginEditing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        print(currentTextField)
    }
    //
    //    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    //        if textField == departmentTextField {
    //               //   textField.text = ""
    //                  return false
    //              }
    //              return true
    //    }
    // textFieldShouldBeginEditing
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        if currentTextField == countryTextField
        {
            if self.CountryData.isEmpty
            {
                return 0
            }
            else
            {
                return 1
            }
        }
        else if currentTextField == departmentTextField
        {
            if self.DepartmentData.isEmpty
            {
                return 0
            }
            else
            {
                return 1
            }
        }
        else if currentTextField == designationTextField
        {
            if self.designationListData.isEmpty
            {
                return 0
            }
            else
            {
                return 1
            }
        }
        else
        {
            if self.StateData.isEmpty
            {
                return 0
            }
            else
            {
                return 1
            }
        }
        //return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == countryTextField
        {
            return CountryData.count
        }
        else  if currentTextField == departmentTextField
        {
            return DepartmentData.count
        }
        else if currentTextField == designationTextField
        {
            return designationListData.count
        }
        else
        {
            return StateData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if currentTextField == countryTextField {
            if (currentTextField.text == ""){
                countryTextField.text = CountryData[0].name
            }
            return CountryData[row].name // dropdown item
        }else  if currentTextField == departmentTextField {
            if (currentTextField.text == ""){
                departmentTextField.text = DepartmentData[0].name
            }
            return DepartmentData[row].name
        }
        else if currentTextField == designationTextField {
            if (currentTextField.text == ""){
                designationTextField.text = designationListData[0].name
            }
            return designationListData[row].name
        }
        else {
            if (currentTextField.text == ""){
                stateTextField.text = StateData[0].name
            }
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
        else  if currentTextField == departmentTextField {
            // return DepartmentData[row].name
            selectedCountry = DepartmentData[row].name
            departmentTextField.text = selectedCountry
            self.selectedDepartmentId = DepartmentData[row].id!
        }
        else if currentTextField == designationTextField {
            // return designationListData.count
            selectedCountry = designationListData[row].name
            designationTextField.text = selectedCountry
            self.selectedDesignationId = designationListData[row].id!
        }
        else{
            selectedCountry = StateData[row].name
            stateTextField.text = selectedCountry
            self.selectedStateId = StateData[row].id!
        }
    }
}






extension AddNewStaffMemberVC {
    
    
    func StaffMemberViewApiCall(id:Int)
    {
        
        viewStaffmemberModel.callStaffMemberViewAPI(id: id) {  [self] (data, error) in
            //   SVProgressHUD.dismiss()
            if data?.status == true {
                
                firstNameTextField.text = data!.data!.firstName ?? ""
                lastNameTextField.text = data!.data!.lAstname ?? ""
                departmentTextField.text = data?.data?.department ?? ""
                designationTextField.text = data?.data?.designation ?? ""
                MobileNumberTextField.text = data?.data?.mobilenumber ?? ""
                emailTextField.text = data?.data?.email ?? ""
                workingTimingTextField.text = data?.data?.workTimings ?? ""
                countryTextField.text = data?.data?.country ?? ""
                stateTextField.text = data?.data?.state ?? ""
                cityTextField.text = data?.data?.cityName ?? ""
                zipcodeTextField.text = data?.data?.zipCode ?? ""
                ipTextField.text = data?.data?.ip ?? ""
                let active = data?.data?.isactive
                print(active)
                if active == true{
                    activeBtn.isSelected = !activeBtn.isSelected
                }
                countryId = (data?.data?.countryid)!
                stateId = (data?.data?.stateid)!
                selectedDepartmentId = (data?.data?.departmentid)!
                selectedDesignationId = (data?.data?.designationid)!
                // activeBtn.isSelected = !activeBtn.isSelected
                //  self.staffmemberList = (data?.data?.staffmemberList)!
                //  UsersVCTbl.reloadData()
            }
        }
    }
    
    func GetCountryApiCall(Token:String){
        
        
        viewModelCountry.callGetCountryAPI(Token: Token) { [self] (GetCountryModel, error) in
            CountryData = (GetCountryModel!.data!.countryList)!
        }
        
    }
    
    
    func GetStateApiCall(Token:String){
        
        viewModelState.callGetStateAPI(Token:Token) { [self] (GetStateModel, error) in
            StateData = (GetStateModel!.data!.stateList)!
        }
        
    }
    
    func GetDepartmentListApiCall(Token: String,UserID: Int,Type: Int){
        
        viewModelDepartment.callDepartmentListAPI(UserID: UserID, Type: Type, Token: Token) { [self] (DepartmentListModel, error) in
            //DepartmentData = (DepartmentListModel!.data!.departmentList)!
            if let data = DepartmentListModel!.data
            {
                if let DepartmentList = data.departmentList
                {
                    DepartmentData = DepartmentList
                }
            }
        }
    }
    
    func GetDesignationListApiCall(Token: String,UserID: Int,Type: Int){
        viewModelDesignation.callDesignationListAPI(UserID: UserID, Type: Type, Token: Token) { [self] (DesignationListModel, error) in
            
            if let data = DesignationListModel!.data
            {
                if let DesignationList = data.designationList
                {
                    designationListData = DesignationList
                }
            }
            
            
            //designationListData = (DesignationListModel!.data!.designationList)!
        }
    }
    
    func GetStaffMemberEditApiCall(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool,IP:String,id:Int,CityName:String,UserID:Int,Type:Int,Token:String){
        SVProgressHUD.show()
        viewModelEdit.callStaffMemberEditAPI(FirstName: FirstName, LastName: LastName,  Department: Department, Designation: Designation, Mobilenumber: Mobilenumber, Email: Email, WorkTimings: WorkTimings, Country: Country, State: State, ZipCode: ZipCode, IsUser: IsUser, IP: IP,Id:id,  CityName: CityName, UserID: UserID, Type: Type, Token: Token) {[self] (StaffMemberEditModel, error) in
            SVProgressHUD.dismiss()
            if StaffMemberEditModel?.status == true {
                view?.makeToast(StaffMemberEditModel?.message, duration: TOAST_TIME, position: .bottom)
                
                navigationController?.popViewController(animated: false)
                
                //  self.staffmemberList = (data?.data?.staffmemberList)!
            }
        }
    }
    
    func GetStaffMemberSaveApiCall(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool,IP:String,CityName:String,UserID:Int,Type:Int,Token:String){
        
        viewModelStaffMemberSave.callStaffMemberSaveAPI(FirstName: FirstName, LastName: LastName,  Department: Department, Designation: Designation, Mobilenumber: Mobilenumber, Email: Email, WorkTimings: WorkTimings, Country: Country, State: State, ZipCode: ZipCode, IsUser: IsUser, IP: IP,CityName: CityName, UserID: UserID, Type: Type, Token: Token) {[self] (StaffMemberSaveModel, error) in
            
            if StaffMemberSaveModel?.status == true {
                view?.makeToast(StaffMemberSaveModel?.message, duration: TOAST_TIME, position: .bottom)
                
                navigationController?.popViewController(animated: false)
                
                //  self.staffmemberList = (data?.data?.staffmemberList)!
            }
        }
    }
    
    
    
}
