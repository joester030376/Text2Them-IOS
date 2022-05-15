//
//  NotificationVC.swift
//  Text2Them
//
//  Created by mac on 21/04/21.
//

import UIKit
import SideMenu
import SVProgressHUD

class NotificationVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var NotificationVCTbl: UITableView!
    var arr = ["1","2","3"]
    let viewModel : ReceiveKeywordListViewModel = ReceiveKeywordListViewModel()
    var receiveKeywordList = [DataReceiveKeywordList]()
    let acceptKeywordViewModel : AcceptKeywordViewModel = AcceptKeywordViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ReceiveKeywordListApiCall(UserId: 61, Type: 3, AdminID: 23, Token: "aca400b3-22b4-463e-ac96-099f40619fdc")
    }
    /*override func viewWillDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: false)
    }*/
    /*override func viewDidDisappear(_ animated: Bool)
    {
        
    }*/
    

    

    override func viewWillLayoutSubviews()
    {
        self.notificationView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return receiveKeywordList.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationVCTblCell", for: indexPath)as! NotificationVCTblCell
        cell.lblMassage.text = receiveKeywordList[indexPath.row].messageContent
        cell.lblName.text = receiveKeywordList[indexPath.row].campaignName
        var dateString = receiveKeywordList[indexPath.row].messageDate!
        print(dateString)
        cell.lblMassageDate.text = receiveKeywordList[indexPath.row].messageDate
       // var datee = convertDateFormat(inputDate: dateString)
       // print(datee)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date (from: dateString)
        print(date)
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm a"

        let oldDate = olDateFormatter.date(from: dateString)
       // let date = dateFormatter.date(from: startDate)
        print(oldDate)
     //   var befor5Minute = (oldDate?.adding(.minute, value: -5))!
     //   print(befor5Minute)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
      //  let currentTime = formatter.string(from: dateString)
        
     //  let change = changeFormat(str: dateString)
      //  print(change)
        
        cell.delegate = self
        return cell
    }
}



extension NotificationVC {
    
    func ReceiveKeywordListApiCall(UserId:Int,Type:Int,AdminID:Int,Token:String)
    {
        SVProgressHUD.show()
    //    viewModel.callStaffMemberListAPI(UserID: UserID, Token: Token) {  [self] (data, error) in
        viewModel.callReceiveKeywordList(UserId: UserId, Type: Type, AdminID: AdminID, Token: Token) { [self] (data, error) in
      
            SVProgressHUD.dismiss()
            receiveKeywordList = (data?.data)!
            NotificationVCTbl.reloadData()
            
         //   departmentList = (data?.data?.departmentList!)!
        /*    if data?.status == true {
                receiveKeywordList = (data?.data.)!
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
            }   */
        }
    }

    func AcceptKeywordApiCall(UserID:Int,Type:Int,AdminId:Int,Token:String,CampaignGUID:String,ReplyFrom:String)
    {
    SVProgressHUD.show()
        acceptKeywordViewModel.callAcceptKeywordAPI(UserID: UserID, Type: Type, AdminId: AdminId, Token: Token, CampaignGUID: CampaignGUID, ReplyFrom: ReplyFrom) { [self] (data, error) in
            SVProgressHUD.dismiss()
            if data?.status == true
            {
                view?.makeToast(data!.message, duration: TOAST_TIME, position: .bottom)
                ReceiveKeywordListApiCall(UserId: 61, Type: 3, AdminID: 23, Token: "aca400b3-22b4-463e-ac96-099f40619fdc")
               // DepartmentListApiCall(Token: Session.token, UserID: Int(Session.id)!, Type: Int(Session.type)!)
                
                //DepartmentListApiCall(UserID: Int(Session.id)!, Token: Session.token)
            } else {
                view?.makeToast(data!.message, duration: TOAST_TIME, position: .bottom)
            }
//            if (ReplayNewMessageModel?.status)!{
//                self.getMessageListIfAvailable()
//            }else{
//                self.view?.makeToast(ReplayNewMessageModel?.message, duration: TOAST_TIME, position: .bottom)
//            }
            //receiveKeywordList = (data?.data)!
        }
    
    }
    
}

extension NotificationVC : NotificationCellDelegate{
    func btnAcceptTapped(cell: NotificationVCTblCell) {
        cell.btnAccept.isSelected = cell.btnAccept.isSelected
        let indexpath = NotificationVCTbl.indexPath(for: cell)
        let selectedUser = receiveKeywordList[(indexpath!.row)]
        print(selectedUser)
        print(selectedUser.campaignGUID)
        let campaignGUID = selectedUser.campaignGUID!
        print(campaignGUID)
        AcceptKeywordApiCall(UserID: 61, Type: 3, AdminId: 23, Token: "aca400b3-22b4-463e-ac96-099f40619fdc", CampaignGUID: "472219c6-1427-40b1-bd25-b4883d1fba23@txtmsgnow.com", ReplyFrom: "2406205232@tmomail.net")
        
    }
    
    
}

/* extension NotificationVC : NotificationCellDelegate{
    func btnAcceptTapped(cell: MessageToUsereTC) {
        cell.btnCheckBox.isSelected = cell.btnCheckBox.isSelected
        let indexpath = NotificationVCTbl.indexPath(for: cell)
        let selectedUser = receiveKeywordList[(indexpath!.row)]
        if cell.btnCheckBox.isSelected == false{
            
            print(selectedUser)
            print(selectedUser.campaignGUID)
            let campaignGUID = selectedUser.campaignGUID
        }
    }
    
 
}  */
