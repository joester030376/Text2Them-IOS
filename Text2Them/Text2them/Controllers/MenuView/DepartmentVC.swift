//
//  DepartmentVC.swift
//  Text2them
//
//  Created by Admin on 04/05/21.
//

import UIKit
import SideMenu
import SVProgressHUD

class DepartmentVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var DepartmentVCTblBGView: UIView!
    @IBOutlet weak var DepartmentVCTbl: UITableView!
    @IBOutlet weak var departmentTextFieldBgView: UIView!
    @IBOutlet weak var BgAlphaView: UIView!
    // @IBOutlet var popupView: UIView!
    @IBOutlet weak var addNewBtn: UIButton!
    
    @IBOutlet weak var PopupView: UIView!
    @IBOutlet weak var PopupTitle: UILabel!
    @IBOutlet weak var PopupTxtFldBgView: UIView!
    @IBOutlet weak var PopupTxtFld: UITextField!
    @IBOutlet weak var PopupCancelBtn: UIButton!
    @IBOutlet weak var PopupSubmitBtn: UIButton!
    
    let viewModelDepartment : DepartmentListViewModel = DepartmentListViewModel()
    var DepartmentData = [DepartmentList]()
    //var DepartmentArr = ["Business Development","Sales & Marketing","Development","Test Team","Research and development","Product development","Admin department","Security and transport"]
    
    var SelectedInd:Int!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
    }
    @IBAction func BackBtnAction(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: false)
    }

    override func viewDidAppear(_ animated: Bool)
    {
        self.HidePopupView()
        //self.BgAlphaView.isHidden = true
    }
    private func setupUI()
    {
        self.departmentTextFieldBgView.RoundCornerViewLayout()
        DepartmentListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
        
    }
    override func viewWillLayoutSubviews()
    {
        self.DepartmentVCTblBGView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        addNewBtn.RoundCornerViewLayout()
        self.GradientImgView.AddGradientView()
        self.PopupTxtFldBgView.RoundCornerViewLayout()
        self.PopupCancelBtn.RoundCornerViewLayout()
        self.PopupSubmitBtn.RoundCornerViewLayout()
        self.PopupView.layer.cornerRadius = 10
    }
    
    func ShowPopupView(Title:String,Text:String,Placeholder:String,isAdd:Bool)
    {
        self.PopupTitle.text = Title
        self.PopupTxtFld.text = Text
        self.PopupTxtFld.placeholder = Placeholder
        if(isAdd)
        {
            PopupSubmitBtn.tag = 1
        }
        else
        {
            PopupSubmitBtn.tag = 0
        }
        self.BgAlphaView.isHidden = false
        self.PopupView.isHidden = false
        
        self.PopupTxtFld.becomeFirstResponder()
    }
    
    func HidePopupView()
    {
        self.PopupTxtFld.resignFirstResponder()
        self.BgAlphaView.isHidden = true
        self.PopupView.isHidden = true
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
    
    @IBAction func addNewButtonAction(_ sender: Any)
    {
        self.ShowPopupView(Title: "Add New Department", Text: "", Placeholder: "Enter Department Name", isAdd: true)
        
        /*let alertController = UIAlertController(title: "Add New Department", message: "", preferredStyle: .alert)
         alertController.addTextField { (textField : UITextField!) -> Void in
         textField.placeholder = "Enter Department Name"
         }
         let saveAction = UIAlertAction(title: "Submit", style: .default, handler: { alert -> Void in
         let firstTextField = alertController.textFields![0] as UITextField
         print(firstTextField.text!)
         if firstTextField.text == ""
         {
         self.view?.makeToast("Please enter Department", duration: TOAST_TIME, position: .bottom)
         } else {
         
         self.DepartmentAddApiCall(Name:firstTextField.text!, UserID: Int(Session.id)!, Token: Session.token)
         }
         })
         let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )
         alertController.addAction(saveAction)
         alertController.addAction(cancelAction)
         self.present(alertController, animated: true, completion: nil)*/
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.DepartmentData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentVCTblCell", for: indexPath)as! DepartmentVCTblCell
        cell.DepartmentNameLbl.text = self.DepartmentData[indexPath.row].name
        cell.EditBtn.tag = indexPath.row
        cell.EditBtn.addTarget(self, action: #selector(EditBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
        cell.DeleteBtn.tag = indexPath.row
        cell.DeleteBtn.addTarget(self, action: #selector(DeleteBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
        return cell
    }
    
    @objc func EditBtn_Clicked(sender:UIButton!)
    {
        self.SelectedInd = sender.tag
        self.ShowPopupView(Title: "Edit Department", Text: self.DepartmentData[sender.tag].name!, Placeholder: "Enter Department Name", isAdd: false)
        
        /*let alertController = UIAlertController(title: "Edit Department", message: "", preferredStyle: .alert)
         alertController.addTextField { (textField : UITextField!) -> Void in
         textField.placeholder = "Enter Department Name"
         textField.text = self.DepartmentData[sender.tag].name
         }
         let saveAction = UIAlertAction(title: "Submit", style: .default, handler: { [self] alert -> Void in
         let firstTextField = alertController.textFields![0] as UITextField
         print(firstTextField.text!)
         if firstTextField.text == ""
         {
         self.view?.makeToast("Please enter Designation", duration: TOAST_TIME, position: .bottom)
         } else {
         //   DesignationEditApiCall(id: self.designationListData[sender.tag].id!, Name: firstTextField.text!, UserID: Int(Session.id)!, Token: Session.token)
         self.DepartmentEditApiCall(id: self.DepartmentData[sender.tag].id!, Name: firstTextField.text!, UserID: Int(Session.id)!, Token: Session.token)
         }
         })
         let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )
         alertController.addAction(saveAction)
         alertController.addAction(cancelAction)
         self.present(alertController, animated: true, completion: nil)*/
    }
    @objc func DeleteBtn_Clicked(sender:UIButton!)
    {
        var alert = UIAlertController()
        alert = UIAlertController(title: "", message: "Are you sure to delete the department?", preferredStyle: .alert)
        let Yesaction = UIAlertAction(title: "Yes", style: .default) { [self] (action) in
            //StaffMemberDeleteApiCall(UserID:Int(Session.id)!, id:staffmemberList[sender.tag].id!)
            
            DepartmentDeleteApiCall(id: self.DepartmentData[sender.tag].id!, UserID: Int(Session.id)!, Token: Session.token)
        }
        let Noaction = UIAlertAction(title: "No", style: .default) { (action) in
        }
        alert.addAction(Yesaction)
        alert.addAction(Noaction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func PopupCancelBtn_Clicked(_ sender: UIButton)
    {
        self.HidePopupView()
    }
    @IBAction func PopupSubmitBtn_Clicked(_ sender: UIButton)
    {
        self.HidePopupView()
        if(sender.tag == 1)
        {
            if self.PopupTxtFld.text! == ""
            {
                self.view?.makeToast("Please enter Department", duration: TOAST_TIME, position: .bottom)
            } else {
                self.DepartmentAddApiCall(Name:self.PopupTxtFld.text!, UserID: Int(Session.id)!, Token: Session.token)
            }
        }
        else
        {
            if self.PopupTxtFld.text! == ""
            {
                self.view?.makeToast("Please enter Department", duration: TOAST_TIME, position: .bottom)
            } else {
                self.DepartmentEditApiCall(id: self.DepartmentData[self.SelectedInd].id!, Name: self.PopupTxtFld.text!, UserID: Int(Session.id)!, Token: Session.token)
            }
        } 
    }
}
extension DepartmentVC
{
    func DepartmentListApiCall(Token: String,UserID: Int,Type: Int){
        SVProgressHUD.show()
        viewModelDepartment.callDepartmentListAPI(UserID: UserID, Type: Type, Token: Token) {
            [self] (DepartmentListModel, error) in
            SVProgressHUD.dismiss()
            if let data = DepartmentListModel!.data
            {
                if let DepartmentList = data.departmentList
                {
                    DepartmentData = DepartmentList
                    self.DepartmentVCTbl.reloadData()
                } 
            }
        }
    }
    
    func DepartmentAddApiCall(Name:String,UserID:Int,Token:String)
    {
        SVProgressHUD.show()
        viewModelDepartment.callDepartmentAddAPI(UserID: UserID, Name: Name, Token: Token){  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true
            {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                DepartmentListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
                //DepartmentListApiCall(UserID: Int(Session.id)!, Token: Session.token)
            }
        }
    }
    func DepartmentEditApiCall(id:Int,Name:String,UserID:Int,Token:String)
    {
        SVProgressHUD.show()
        viewModelDepartment.callDepartmentEditAPI(UserID: UserID, Name: Name, Token: Token, id: id) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true
            {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                DepartmentListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
                
                //DepartmentListApiCall(UserID: Int(Session.id)!, Token: Session.token)
            }
        }
    }
    func DepartmentDeleteApiCall(id:Int,UserID:Int,Token:String)
    {
        SVProgressHUD.show()
        viewModelDepartment.callDepartmentDeleteAPI(UserID: UserID, id: id, Token: Token) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true
            {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                DepartmentListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
            }
        }
    }
}
