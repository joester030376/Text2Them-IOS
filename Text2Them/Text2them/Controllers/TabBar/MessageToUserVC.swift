//
//  MessageToUserVC.swift
//  Text2them
//
//  Created by pratik joshi on 25/10/21.
//

import UIKit
import SVProgressHUD
import SideMenu

class MessageToUserVC: UIViewController {
    
    @IBOutlet weak var tblUsers: UITableView!
    
    @IBOutlet weak var viewStaffMember: UIView!
    @IBOutlet weak var viewAdmin: UIView!
    @IBOutlet weak var viewSales: UIView!
    
    @IBOutlet weak var txtStaffMember: UITextField!
    @IBOutlet weak var txtAdmin: UITextField!
    @IBOutlet weak var txtSales: UITextField!
    @IBOutlet weak var txtSubject: UITextField!
  
    
    @IBOutlet weak var txtViewMessage: UITextView!
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    let viewModel : ContactToUserDropDownListViewModel = ContactToUserDropDownListViewModel()
    let viewUsersListModel : ContactToUserGetUsersListViewModel = ContactToUserGetUsersListViewModel()
    let viewSendMessagetoUsersModel : SendMessagetoUsersViewModel = SendMessagetoUsersViewModel()
    var departmentList = [MessageDepartmentList]()
    var designationList = [MessageDesignationList]()
    var userList = [DataUserList]()
    var filterArray = [DataUserList]()
    var arrUserType = ["Staff Member","Contact"]
    var selectedMember: String?
    var currentTextField = UITextField()
    var intUserType = 1
    var userType = Int()
   // var filterArray = [Int]()
    var departmentId = Int()
    var Designationid = Int()
    var ContactGroup = Int()
    var dic = NSMutableDictionary()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactGroup = 0
        departmentId = 0
        Designationid = 0
        
        txtAdmin.delegate = self
        txtStaffMember.delegate = self
      //  userType = 2
       // Int(Session.id)!
        
        ContactToUserDropDownListApiCall(AdminId: Int(Session.AdminId)!, Token: Session.token, Type: Int(Session.type)!, UserID: Int(Session.id)!, UserType: intUserType)
       // ContactToUserDropDownListApiCall(AdminId: 23, Token: "62e1f167-3a64-4e9f-b665-04feec0fd29f", Type: 3, UserID: 61, UserType: 2)
        
      //  ContactToUserDropDownListApiCall(AdminId: 0, Token: "62e1f167-3a64-4e9f-b665-04feec0fd29f", Type: 2, UserID: 61, UserType: 2)
        setUI()
        
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        print(currentTextField)
    }
    
    @IBAction func notificationButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc,animated: false)
    }
    
    @IBAction func btnSearchClicked(_ sender: Any) {

        let errMessage = checkValidation()
            if errMessage == ""{
             //   ContactToUserGetUsersListApiCall(AdminId: 23, ContactGroup: 0, Departmentid: departmentId, Designationid: Designationid, Token: "aca400b3-22b4-463e-ac96-099f40619fdc", Type: 3, UserID: 61, UserType: 2)
                
                ContactToUserGetUsersListApiCall(AdminId: Int(Session.AdminId)!, ContactGroup: 0, Departmentid: departmentId, Designationid: Designationid, Token: Session.token, Type: Int(Session.type)!, UserID: Int(Session.id)!, UserType: intUserType)

              //  ContactToUserGetUsersListApiCall(AdminId: Int(Session.AdminId)!, ContactGroup: ContactGroup, Departmentid: departmentId, Designationid: Designationid, Token: "aca400b3-22b4-463e-ac96-099f40619fdc", Type: 3, UserID: Int(Session.id)!, UserType: 2)
            }
                else{
                    view?.makeToast(errMessage, duration: TOAST_TIME, position: .bottom)
                }
        
    }
    @IBAction func btnSendClicked(_ sender: Any) {
        var dic = [String:Any]()
        var myArray = [[String: Any]]()
        for obj in filterArray {
            dic["MobileNo"] = obj.phonenumber
            dic["NetworkEMail"] = obj.networkEmailID
            print(dic)
            myArray.append(dic as! [String : Any])
            print(myArray)
        }
        print(dic)
       // myArray.append(dic as! [String : Any])
        print(myArray)
        //SendMessagetoUsersApiCall
       // SendMessagetoUsersApiCall(AdminId: 0, MeesageTouserList: myArray, MessageText: "Test Message To all", Subject: "Message to user", Token: "62e1f167-3a64-4e9f-b665-04feec0fd29f", Type: 2, UserID: 70)
        SendMessagetoUsersApiCall(AdminId: Int(Session.AdminId)!, MeesageTouserList: myArray, MessageText: txtViewMessage.text, Subject: txtSubject.text!, Token: Session.token, Type: 2, UserID: Int(Session.id)!)
        
       // (AdminId: Int(Session.AdminId)!, Token: Session.token, Type: 3, UserID: Int(Session.id)!, UserType: userType)
    }
    
    func setUI(){
       // viewStaffMember.layer.cornerRadius = viewStaffMember.frame.height / 2
       // viewAdmin.layer.cornerRadius = viewAdmin.frame.height / 2
       // viewSales.layer.cornerRadius = viewSales.frame.height / 2
       // viewStaffMember.cornerRadius
        let color = UIColor.lightGray
        let placeholder = txtAdmin.placeholder ?? "Please Select" //There
        txtAdmin.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder1 = txtSales.placeholder ?? "Please Select" //There
        txtSales.attributedPlaceholder = NSAttributedString(string: placeholder1, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = txtSales.placeholder ?? "Please Select" //There
        txtStaffMember.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        createPickerView()
    }
    
    func checkValidation() -> String{
        var message = String()
        
        if txtStaffMember.text == "Staff Member" {
        if txtStaffMember.text == ""
        {
            message = "Please select User"
        }
        else if txtAdmin.text == ""
        {
            message = "Please select department"
        }
       
        else if txtSales.text == ""
        {
            message = "Please select designation"
        }
        
        } else {
            if txtStaffMember.text == ""
            {
                message = "Please select User"
            }
            else if txtAdmin.text == ""
            {
                message = "Please select department"
            }
            
        }
        return message
    }

    
    func createPickerView()
    {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        txtStaffMember.inputView = pickerView
        txtAdmin.inputView = pickerView
        txtSales.inputView = pickerView
        dismissPickerView()
        
    }
    
    func dismissPickerView()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        txtStaffMember.inputAccessoryView = toolBar
    }
    
    @objc func action(){
        view.endEditing(true)
    }
    
}

extension MessageToUserVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageToUsereTC", for: indexPath)as! MessageToUsereTC
        cell.lblUseerName.text = userList[indexPath.row].name
        cell.lblUserRoal.text = userList[indexPath.row].designation ?? "Developer"
        cell.lblUserPhoneNumber.text = userList[indexPath.row].phonenumber
        //cell.lblUserID.text = userList[indexPath.row].
        cell.delegate = self
        return cell
    }
}

extension MessageToUserVC: UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        //return arrUserType.count
        print(currentTextField)
        if currentTextField == txtStaffMember
        {
            return arrUserType.count
        }
        else if currentTextField == txtAdmin
        {
            return departmentList.count
        } else 
        {
            return designationList.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        //return arrUserType[row] // dropdown item
      //  txtStaffMember
        if currentTextField == txtStaffMember {
          /*  if (currentTextField.text == ""){
                countryTextField.text = CountryData[0].name
            } */
            return arrUserType[row] // dropdown item
        }else  if currentTextField == txtAdmin {
       
            return departmentList[row].deptName
        } else {
            return designationList[row].name
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
    /*    if selectedMember == "Staff Member"{
            intUserType = 1
            viewAdmin.isHidden = false
            viewSales.isHidden = false
            selectedMember = arrUserType[row] // selected item
            txtStaffMember.text = selectedMember
            txtAdmin.placeholder = "Admin"
            txtSales.placeholder = "Selse Executive"
        }else{
            intUserType = 2
            viewAdmin.isHidden = false
            viewSales.isHidden = true
            txtAdmin.placeholder = "Please Select"
        } */
        
        
        if currentTextField == txtStaffMember {
            selectedMember = arrUserType[row] // selected item
            txtStaffMember.text = selectedMember
           // txtAdmin.placeholder = "Admin"
            
      /*      let color = UIColor.darkGray
            let placeholder = txtAdmin.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
            txtAdmin.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
            txtSales.placeholder = "Selse Executive" */
            let color = UIColor.lightGray
            let placeholder = txtAdmin.placeholder ?? "Please Select"
            txtAdmin.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
            
            let placeholder1 = txtSales.placeholder ?? "Please Select" //There
            txtSales.attributedPlaceholder = NSAttributedString(string: placeholder1, attributes: [NSAttributedString.Key.foregroundColor : color])

           // intUserType = 1
            
            if selectedMember == "Staff Member"{
                viewAdmin.isHidden = false
                viewSales.isHidden = false
                ContactGroup = 0
                txtAdmin.text = ""
                intUserType = 1

                let placeholder1 = txtSales.placeholder ?? "Please Select" //There
                txtAdmin.attributedPlaceholder = NSAttributedString(string: placeholder1, attributes: [NSAttributedString.Key.foregroundColor : color])
            } else {
                viewAdmin.isHidden = false
                viewSales.isHidden = true
                txtAdmin.text = ""
                intUserType = 2

            }
        }else  if currentTextField == txtAdmin {
       
            txtAdmin.text = departmentList[row].deptName
            departmentId = departmentList[row].id!
            ContactGroup = departmentList[row].id!
            viewSales.isHidden = true
            if selectedMember == "Staff Member"{
                viewAdmin.isHidden = false
                viewSales.isHidden = false
            } else {
                viewAdmin.isHidden = false
                viewSales.isHidden = true
            }
        } else {
            txtSales.text = designationList[row].name
            Designationid = designationList[row].id!
            ContactGroup = designationList[row].id!
            viewSales.isHidden = true
            if selectedMember == "Staff Member"{
                viewAdmin.isHidden = false
                viewSales.isHidden = false
            } else {
                viewAdmin.isHidden = false
                viewSales.isHidden = true
            }
        }
        
    }
    
}


extension MessageToUserVC {
    
  /*  func StaffMemberDeleteApiCall(UserID:Int,id:Int){
        SVProgressHUD.show()
        deleteStaffmemberModel.callStaffMemberDeleteAPI(UserID: UserID, id: id) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                StaffMemberListApiCall(UserID: Int(Session.id)!, Token: Session.token)
                //  self.staffmemberList = (data?.data?.staffmemberList)!
            }
            else{
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }  */
    
    func ContactToUserDropDownListApiCall(AdminId:Int,Token:String,Type:Int,UserID:Int,UserType:Int){
         SVProgressHUD.show()
        viewModel.callContactToUserDropDownListAPI(AdminId: AdminId, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { [self] (data, error) in
            SVProgressHUD.dismiss()
            print(data)
            print(data?.data)
            departmentList = (data?.data?.departmentList)!
            print(departmentList)
            designationList = (data?.data?.designationList!)!

        }

    }
    
    func ContactToUserGetUsersListApiCall(AdminId:Int,ContactGroup:Int,Departmentid:Int,Designationid:Int,Token:String,Type:Int,UserID:Int,UserType:Int){
        SVProgressHUD.show()
        viewUsersListModel.callContactToUserGetUsersListAPI(AdminId: AdminId, ContactGroup: ContactGroup, Departmentid: Departmentid, Designationid: Designationid, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { [self] (data, error) in
            SVProgressHUD.dismiss()
            print(data)
            userList = (data?.data)!
            self.tblUsers.reloadData()
            
        }
        
    }
    
    func SendMessagetoUsersApiCall(AdminId:Int,MeesageTouserList:[[String : Any]],MessageText:String,Subject:String,Token:String,Type:Int,UserID:Int){
        SVProgressHUD.show()
        viewSendMessagetoUsersModel.callSendMessagetoUsersAPI(AdminId: AdminId, MeesageTouserList: MeesageTouserList, MessageText: MessageText, Subject: Subject, Token: Token, Type: Type, UserID: UserID) { [self] (data, error) in
            SVProgressHUD.dismiss()
            print(data)
            if data?.status == true {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
            else{
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
}

extension MessageToUserVC : MyCellDelegate{
    func btnCheckTapped(cell: MessageToUsereTC) {
        print("hello")
        cell.btnCheckBox.isSelected = cell.btnCheckBox.isSelected
        let indexpath = tblUsers.indexPath(for: cell)
        let selectedUser = userList[(indexpath!.row)]
        if cell.btnCheckBox.isSelected == false{
            let image = UIImage(named: "checkbox")
            cell.btnCheckBox.setImage(image, for: .selected)
            cell.btnCheckBox.isSelected = true
            let mobileNumber = cell.lblUserPhoneNumber.text
            let name = cell.lblUseerName.text
           // dic.setValue(mobileNumber, forKey: "MobileNo")
           // dic.setValue(name, forKey: "NetworkEMail")
            print(selectedUser)
            filterArray.append(selectedUser)
            print(filterArray)

           // myArray.append(dic as! [String : Any])
           // print(myArray)
          //  filterArray.append(cell.)
        } else {
           // let index = filterArray.index(of: selectedUser)
            //let index = filterArray.index(of: sen)
           
          //  let index = self.filterArray.index(of: selectedUser)
            
            
            var filtered = filterArray.filter { $0.networkEmailID != selectedUser.networkEmailID }
            let image = UIImage(named: "blank-check-box")
            cell.btnCheckBox.setImage(image, for: .normal)
            cell.btnCheckBox.isSelected = false
            filterArray = filtered
           // filterArray.remove(at: <#T##Int#>)
          //  filterArray.remove(at: index)
            print(filterArray)
          //  filterArray.remove(at: <#T##Int#>)
           // dic.removeObject(forKey: "MobileNo")
          //  dic.removeObject(forKey: "NetworkEMail")
           // print(dic)
           // myArray.remove(at: <#T##Int#>)
        }
        
    }
    
    
    
    
}
