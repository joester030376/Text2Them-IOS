//
//  YourCurrentPlanVC.swift
//  Text2Them
//
//  Created by mac on 22/04/21.
//

import UIKit
import SideMenu
import SVProgressHUD

class YourCurrentPlanVC: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var planView: UIView!
    @IBOutlet weak var YourCurrentPlanVCTbl: UITableView!
    
    var viewModel : SubscriptionDetailViewModel = SubscriptionDetailViewModel()
    var arrDetails = [DataSubscriptionDetail]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        YourCurrentPlanVCTbl.tableFooterView = UIView()
        getSubscriptionList()
    }
    /*override func viewDidDisappear(_ animated: Bool)
     {
     navigationController?.popViewController(animated: false)
     }*/
    
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
    
    override func viewWillLayoutSubviews()
    {
        self.planView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.GradientImgView.AddGradientView()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return arrDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCurrentPlanVCTblCell", for: indexPath)as! YourCurrentPlanVCTblCell
        
        var string = "\(arrDetails[indexPath.row].SubscriptionEndDate!)"
        let array = string.components(separatedBy: ".")
        if array.count > 1{
            string = array[0]
        }
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        
        cell.lblPlanName.text = "Plan Name: \(arrDetails[indexPath.row].PlanName!)"
        cell.lblPlanEndDate.text = "Plan End Date: \(dateString)"
        cell.lblContact.text = "Contact: \(arrDetails[indexPath.row].ContactRangeStart!) TO \(arrDetails[indexPath.row].ContactRangeEnd!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension YourCurrentPlanVC{
    
    func getSubscriptionList(){
        SVProgressHUD.show()
        viewModel.callSubscriptionDetail(UserId: Int(Session.id)!, Type: Session.type) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            if data!.status == true
            {
                arrDetails = (data?.data?.usersubscriptionList ?? [DataSubscriptionDetail]())
                YourCurrentPlanVCTbl.reloadData()
            }
        }
    }
}
