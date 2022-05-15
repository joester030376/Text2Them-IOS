
//
//  UsersVC.swift
//  Text2them
//
//  Created by Admin on 28/04/21.
//

import UIKit
import SideMenu
import SVProgressHUD

class UsersVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var UsersVCTblBGView: UIView!
    @IBOutlet weak var UsersVCTbl: UITableView!
    
    @IBOutlet weak var BgAlphaView: UIView!
    @IBOutlet weak var MemberDetailView: UIView!
    
    @IBOutlet weak var MemberDetailTbl: UITableView!
    @IBOutlet weak var MemberDetailViewOkBtn: UIButton!
    @IBOutlet weak var addNewBtn: UIButton!
    
    @IBOutlet weak var viewMobileNumberChange: UIView!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var btnCancelNumber: UIButton!
    @IBOutlet weak var btnSubmitNumber: UIButton!
    
    let viewModel : StaffMemberListViewModel = StaffMemberListViewModel()
    var staffmemberList : [StaffmemberList] = [StaffmemberList]()
    var viewStaffmemberModel : StaffMemberViewViewModel = StaffMemberViewViewModel()
    var deleteStaffmemberModel : StaffMemberDeleteViewModel = StaffMemberDeleteViewModel()
    var chagneMobileNumber : StaffMemberChangeNumberViewModel = StaffMemberChangeNumberViewModel()
    
    
    var dictionary =  [String:Any]()
    var arrList = ["First Name","Last Name","Department","Designation","Mobile Number","Email","WorkTimings","Country","State","City","ZipCode","Isactive"]
    var value = [String]()
    var strStaffID = Int()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
    }
    override func viewWillLayoutSubviews()
    {
        self.UsersVCTblBGView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.MemberDetailViewOkBtn.RoundCornerViewLayout()
        self.btnCancelNumber.RoundCornerViewLayout()
        self.btnSubmitNumber.RoundCornerViewLayout()
        self.txtMobileNumber.layer.cornerRadius = self.txtMobileNumber.frame.height / 2
        addNewBtn.RoundCornerViewLayout()
        self.GradientImgView.AddGradientView()
    }
    private func setupUI()
    {
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        self.HideMemberDetailView()
        
        StaffMemberListApiCall(UserID: Int(Session.id)!, Token: Session.token)
    }
    
    private func ShowMemberDetailView()
    {
        self.BgAlphaView.isHidden = false
        self.MemberDetailView.isHidden = false
    }
    private func HideMemberDetailView()
    {
        self.BgAlphaView.isHidden = true
        self.MemberDetailView.isHidden = true
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
    
    @IBAction func MemberDetailViewOkBtn_Clicked(_ sender: UIButton)
    {
        self.HideMemberDetailView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableView == UsersVCTbl)
        {
            return staffmemberList.count
        }
        else
        {
            // return 10
            return dictionary.count
           // return arrList.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == UsersVCTbl)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UsersVCTblCell", for: indexPath)as! UsersVCTblCell
            cell.departmentNameLbl.text = "\(String(describing: staffmemberList[indexPath.row].departmentName!))"
            cell.nameLbl.text = "\( String(describing: staffmemberList[indexPath.row].name!)) |"
            cell.designationNameLbl.text = staffmemberList[indexPath.row].designationName
            cell.phoneNumberLbl.text = staffmemberList[indexPath.row].phoneNumber
            let isActive = staffmemberList[indexPath.row].isActive
            if isActive == true {
//                cell.ActiveBtn.isHidden = false
//                cell.DeActiveBtn.isHidden = true
                cell.lblDeactive.text = "Active |"
                cell.lblDeactive.textColor = .green
            } else {
//                cell.ActiveBtn.isHidden = true
//                cell.DeActiveBtn.isHidden = false
                cell.lblDeactive.text = "Deactive |"
                cell.lblDeactive.textColor = .red
            }
//            cell.ActiveBtn.tag = indexPath.row
//            cell.ActiveBtn.addTarget(self, action: #selector(ActiveBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
//            cell.DeActiveBtn.tag = indexPath.row
//            cell.DeActiveBtn.addTarget(self, action: #selector(DeActiveBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
            cell.ViewBtn.tag = indexPath.row
            cell.ViewBtn.addTarget(self, action: #selector(ViewBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
            cell.EditBtn.tag = indexPath.row
            cell.EditBtn.addTarget(self, action: #selector(EditBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
            cell.DeleteBtn.tag = indexPath.row
            cell.DeleteBtn.addTarget(self, action: #selector(DeleteBtn_Clicked(sender:)), for: UIControl.Event.touchUpInside)
            
            cell.btnEditNumber.tag = indexPath.row
            cell.btnEditNumber.addTarget(self, action: #selector(btnEditNumberCLicked(sender:)), for: UIControl.Event.touchUpInside)
            
            
           // cell.BgView.setCornerRadius(cornerRadius: 10)
            cell.BgView.cardView()
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MemberDetailTblCell", for: indexPath)as! MemberDetailTblCell
            cell.TitleLbl.text = "\(arrList[indexPath.row] + " :-")"
            let key = arrList[indexPath.row]
            
            if let value = dictionary[key]{
                cell.DetailLbl.text = value as? String
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(tableView == UsersVCTbl)
        {
            return 170
        }else{
            return UITableView.automaticDimension
        }
    }
    
    @objc func ActiveBtn_Clicked(sender:UIButton!)
    {
        print(sender.tag)
    }
    @objc func DeActiveBtn_Clicked(sender:UIButton!)
    {
        print(sender.tag)
    }
    @objc func ViewBtn_Clicked(sender:UIButton!)
    {
        print(staffmemberList[sender.tag].id)
        print(sender.tag)
        StaffMemberViewApiCall(id: staffmemberList[sender.tag].id!)
    }
    
    @objc func EditBtn_Clicked(sender:UIButton!)
    {
        print(sender.tag)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewStaffMemberVC") as! AddNewStaffMemberVC
        vc.staffMemberId = staffmemberList[sender.tag].id!
        self.navigationController?.pushViewController(vc,animated: false)
    }
    
    @IBAction func addNewButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewStaffMemberVC") as! AddNewStaffMemberVC
        vc.check = "AddNew"
        self.navigationController?.pushViewController(vc,animated: false)
    }
    
    @objc func DeleteBtn_Clicked(sender:UIButton!)
    {
        print(sender.tag)
        
        var alert = UIAlertController()
        alert = UIAlertController(title: "", message: "Are you sure to delete the user?", preferredStyle: .alert)
        let Yesaction = UIAlertAction(title: "Yes", style: .default) { [self] (action) in
            // StaffMemberDeleteApiCall(
            StaffMemberDeleteApiCall(UserID:Int(Session.id)!, id:staffmemberList[sender.tag].id!)
        }
        let Noaction = UIAlertAction(title: "No", style: .default) { (action) in
        }
        alert.addAction(Yesaction)
        alert.addAction(Noaction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func btnEditNumberCLicked(sender:UIButton!){
        BgAlphaView.isHidden = false
        viewMobileNumberChange.isHidden = false
        
        strStaffID = staffmemberList[sender.tag].id!
    }
    
    @IBAction func btnCancelNumberClicked(_ sender: Any) {
        BgAlphaView.isHidden = true
        viewMobileNumberChange.isHidden = true
    }
    
    @IBAction func btnSubmitNumberClicked(_ sender: Any) {
        if txtMobileNumber.text != ""{
            chnageStaffMemberNumber(UserID: Int(Session.id)!, StaffmemberId: strStaffID, Mobilenumber: txtMobileNumber.text!, Token: Session.token)
        }else{
            view?.makeToast("Please Enter Mobile Number", duration: TOAST_TIME, position: .bottom)
        }
    }
}

extension UsersVC {
    func StaffMemberListApiCall(UserID:Int,Token:String)
    {
        SVProgressHUD.show()
        viewModel.callStaffMemberListAPI(UserID: UserID, Token: Token) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true {
                self.staffmemberList = (data?.data?.staffmemberList)!
                UsersVCTbl.reloadData()
                if(self.staffmemberList.count == 0)
                {
                    var alert = UIAlertController()
                    alert = UIAlertController(title: "", message: "There is no records in staff members", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    func StaffMemberViewApiCall(id:Int)
    {
        SVProgressHUD.show()
        viewStaffmemberModel.callStaffMemberViewAPI(id: id) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true {
                //dictionary["key"] = "value"
                //                for i in data!.data!.{
                //                    value.append(i)
                //                }
                dictionary["First Name"] = data?.data?.firstName
                dictionary["Last Name"] = data?.data?.lAstname
                dictionary["Department"] = data?.data?.department
                dictionary["Designation"] = data?.data?.designation
                dictionary["Mobile Number"] = data?.data?.mobilenumber
                dictionary["Email"] = data?.data?.email
                dictionary["WorkTimings"] = data?.data?.workTimings
                dictionary["Country"] = data?.data?.country
                dictionary["State"] = data?.data?.state
                dictionary["City"] = data?.data?.cityName
                
                dictionary["ZipCode"] = data?.data?.zipCode
                
                if let isactive = data?.data?.isactive
                {
                    dictionary["Isactive"] = String(isactive)
                }
                else
                {
                    dictionary["Isactive"] = ""
                }
                //dictionary["Isactive"] = ""
                
                MemberDetailTbl.reloadData()
                
                self.ShowMemberDetailView()
                
                //  self.staffmemberList = (data?.data?.staffmemberList)!
                //  UsersVCTbl.reloadData()
            }
            else{
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    } 
    
    func StaffMemberDeleteApiCall(UserID:Int,id:Int){
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
    }
    
    func chnageStaffMemberNumber(UserID:Int, StaffmemberId:Int, Mobilenumber:String, Token:String){
        SVProgressHUD.show()
        
        chagneMobileNumber.callStaffMemberDeleteAPI(UserID: UserID, StaffmemberId: StaffmemberId, Mobilenumber: Mobilenumber, Token: Token){  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true {
                BgAlphaView.isHidden = true
                viewMobileNumberChange.isHidden = true
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
                self.HideMemberDetailView()
                StaffMemberListApiCall(UserID: Int(Session.id)!, Token: Session.token)
            }
            else{
                view?.makeToast(data?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
}
extension UIView{
    func cardView() -> Void {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
    }
}

