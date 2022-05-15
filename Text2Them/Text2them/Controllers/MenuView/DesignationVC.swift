//
//  DesignationVC.swift
//  Text2them
//
//  Created by Admin on 04/05/21.
//

import UIKit
import SideMenu
import SVProgressHUD

class DesignationVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var DesignationVCTblBGView: UIView!
    @IBOutlet weak var DesignationVCTbl: UITableView!
    
    @IBOutlet weak var BgAlphaView: UIView!
    
    @IBOutlet weak var addNewBtn: UIButton!
    
    @IBOutlet weak var PopupView: UIView!
    @IBOutlet weak var PopupTitle: UILabel!
    @IBOutlet weak var PopupTxtFldBgView: UIView!
    @IBOutlet weak var PopupTxtFld: UITextField!
    @IBOutlet weak var PopupCancelBtn: UIButton!
    @IBOutlet weak var PopupSubmitBtn: UIButton!
    
    let viewModelDesignation : DesignationListViewModel = DesignationListViewModel()
    var designationListData = [DesignationList]()
    //var DesignationArr = ["Business Development","Sales & Marketing","Development","Test Team","Research and development","Product development","Admin department","Security and transport"]
    
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
    }
    private func setupUI()
    {
        DesignationListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
    }
    override func viewWillLayoutSubviews()
    {
        self.DesignationVCTblBGView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
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
        self.ShowPopupView(Title: "Add New Designation", Text: "", Placeholder: "Enter Designation Name", isAdd: true)
        
        /*let alertController = UIAlertController(title: "Add New Designation", message: "", preferredStyle: .alert)
        
        alertController.setValue(NSAttributedString(string: "Add New Designation", attributes: [NSAttributedString.Key.font : "",NSAttributedString.Key.foregroundColor : UIColor.blue]), forKey: "attributedTitle")

        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Designation Name"
        }
        let saveAction = UIAlertAction(title: "Submit", style: .destructive, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            print(firstTextField.text!)
            if firstTextField.text == ""
            {
                self.view?.makeToast("Please enter Designation", duration: TOAST_TIME, position: .bottom)
            } else {
               // DesignationAddApiCall(Name: firstTextField.text!, UserID:  Int(Session.id)!, Token: Session.type)
                self.DesignationAddApiCall(Name:  firstTextField.text!, UserID: Int(Session.id)!, Token: Session.token)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )
       
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
       // deleteAction.setValue(color, forKey: titleTextColor)
      //  saveAction.back
        self.present(alertController, animated: true, completion: nil)*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.designationListData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DesignationVCTblCell", for: indexPath)as! DesignationVCTblCell
        cell.DesignationNameLbl.text = self.designationListData[indexPath.row].name
        cell.EditBtn.tag = indexPath.row
        cell.EditBtn.addTarget(self, action: #selector(EditBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
        cell.DeleteBtn.tag = indexPath.row
        cell.DeleteBtn.addTarget(self, action: #selector(DeleteBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
        return cell
    }
    
    @objc func EditBtn_Clicked(sender:UIButton!)
    {
        self.SelectedInd = sender.tag
        self.ShowPopupView(Title: "Edit Designation", Text: self.designationListData[sender.tag].name!, Placeholder: "Enter Designation Name", isAdd: false)
        /*let alertController = UIAlertController(title: "Edit Designation", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Designation Name"
            textField.text = self.designationListData[sender.tag].name
        }
        let saveAction = UIAlertAction(title: "Submit", style: .default, handler: { [self] alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            print(firstTextField.text!)
            //DesignationEditApiCall
        
            if firstTextField.text == ""
            {
                self.view?.makeToast("Please enter Designation", duration: TOAST_TIME, position: .bottom)
            } else {
                DesignationEditApiCall(id: self.designationListData[sender.tag].id!, Name: firstTextField.text!, UserID: Int(Session.id)!, Token: Session.token)
            }
        })
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)*/
    }
    @objc func DeleteBtn_Clicked(sender:UIButton!)
    {
        print(sender.tag)
        var alert = UIAlertController()
        alert = UIAlertController(title: "", message: "Are you sure to delete the designation?", preferredStyle: .alert)
        let Yesaction = UIAlertAction(title: "Yes", style: .default) { [self] (action) in
            //StaffMemberDeleteApiCall(UserID:Int(Session.id)!, id:staffmemberList[sender.tag].id!)
            //DesignationDeleteApiCall
            DesignationDeleteApiCall(id: self.designationListData[sender.tag].id!, UserID: Int(Session.id)!, Token: Session.token)
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
                self.view?.makeToast("Please enter Designation", duration: TOAST_TIME, position: .bottom)
            } else {
                self.DesignationAddApiCall(Name: self.PopupTxtFld.text!, UserID: Int(Session.id)!, Token: Session.token)
            }
        }
        else
        {
            if self.PopupTxtFld.text! == ""
            {
                self.view?.makeToast("Please enter Designation", duration: TOAST_TIME, position: .bottom)
            } else {
                DesignationEditApiCall(id: self.designationListData[self.SelectedInd].id!, Name: self.PopupTxtFld.text!, UserID: Int(Session.id)!, Token: Session.token)
            }
        }
    }
}
extension DesignationVC
{
    func DesignationListApiCall(Token: String,UserID: Int,Type: Int){
        SVProgressHUD.show()
        viewModelDesignation.callDesignationListAPI(UserID: UserID, Type: Type, Token: Token) { [self] (DesignationListModel, error) in
            SVProgressHUD.dismiss()
            if let data = DesignationListModel!.data
            {
                if let DesignationList = data.designationList
                {
                    designationListData = DesignationList
                    self.DesignationVCTbl.reloadData()
                }
            }
        }
    }
    
   
    func DesignationAddApiCall(Name:String,UserID:Int,Token:String)
    {
        SVProgressHUD.show()

        viewModelDesignation.callDesignationAddAPI(UserID: UserID, Name: Name, Token: Token) {[self] (DesignationListModel, error) in
            
            if DesignationListModel?.status == true {
                view?.makeToast(DesignationListModel?.message, duration: TOAST_TIME, position: .bottom)
                DesignationListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)

               
            }
            else{
                    view?.makeToast(DesignationListModel?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    func DesignationEditApiCall(id:Int,Name:String,UserID:Int,Token:String)
    {
        SVProgressHUD.show()
      //  deleteStaffmemberModel.callStaffMemberDeleteAPI(UserID: UserID, id: id) {  [self] (data, error) in
      //  viewModelDesignation.callDesignationDeleteAPI(UserID: UserID, id: id, Token: Token) {  [self] (data, error) in
        viewModelDesignation.callDesignationEditAPI(UserID: UserID, Name: Name, Token: Token, id: id) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                DesignationListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
            }
            else{
                    view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    func DesignationDeleteApiCall(id:Int,UserID:Int,Token:String)
    {
        SVProgressHUD.show()
      //  deleteStaffmemberModel.callStaffMemberDeleteAPI(UserID: UserID, id: id) {  [self] (data, error) in
        viewModelDesignation.callDesignationDeleteAPI(UserID: UserID, id: id, Token: Token) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true {
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                DesignationListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
            }
            else{
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
}
