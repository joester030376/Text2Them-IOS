//
//  MenuVC.swift
//  Text2Them
//
//  Created by mac on 22/04/21.
//

import UIKit
import SDWebImage

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        
        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}


struct ItemList
{
    var name: String
    var items: [String]
    var collapsed: Bool
    init(name: String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}
var sections = [ItemList]()
//var items: [ItemList] = [
//    ItemList(name: "My Plan", items: []),
//    ItemList(name: "Change Password", items: []),
//    ItemList(name: "Send Message", items: []),
//    ItemList(name: "Messages", items: []),
//    ItemList(name: "Privacy Policy", items: []),
//    ItemList(name: "Setting", items: ["Department","Designation"]),
//    ItemList(name: "Signout", items: [])
//]

var items: [ItemList] = [
    ItemList(name: "My Plan", items: []),
    ItemList(name: "Send Message", items: []),
    ItemList(name: "Chat", items: []),
    ItemList(name: "Chanage Password", items: []),
    ItemList(name: "Privacy Policy", items: []),
    ItemList(name: "Setting", items: ["Department","Designation"]),
    ItemList(name: "Signout", items: [])
]

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var GradientImgView: UIImageView!
    @IBOutlet weak var ProfileImgView: UIImageView!
    @IBOutlet weak var UserNameLbl: UILabel!
    @IBOutlet weak var UserStateLbl: UILabel!
    
    @IBOutlet weak var MenuVCTbl: UITableView!
    //@IBOutlet weak var tableview:UITableView!
    
    var expandable = false
    var row1 = 4
    var row2 = 1
    
    var ImgArr = ["planning","comment","chatMenu","padlock","insurance","settings","logout"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //tableview.delegate = self
        //tableview.dataSource = self
        //self.tableview.tableFooterView = UIView()
    }
    override func viewWillLayoutSubviews()
    {
        self.GradientImgView.AddGradientView()
        self.ProfileImgView.RoundCornerViewLayout()
    }
    
    func showAlert() {
        var refreshAlert = UIAlertController(title: "", message: "Are you sure you want to logout? ", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true) {
                let domain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: domain)
                UserDefaults.standard.synchronize()
                
                Helper.sharedHelper.goToLogin()
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
            refreshAlert .dismiss(animated: true, completion: nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.UserNameLbl.text = Session.userName
        if(Session.statename != "")
        {
            self.UserStateLbl.text = Session.statename
        }
        if(Session.profileImage != "")
        {
            self.ProfileImgView.sd_setShowActivityIndicatorView(true)
            self.ProfileImgView.sd_setIndicatorStyle(.medium)
            self.ProfileImgView.sd_setImage(with: URL(string: Session.profileImage), placeholderImage: UIImage(named: "Group 180"), options: SDWebImageOptions(rawValue: 0))
        }
        
        items[5].collapsed = false
        MenuVCTbl.reloadData()
    }
    
    @IBAction func ActionCloseButton(_ sender: UIBarButtonItem)
    {
        /*UIView.animate(withDuration: 0.4, animations: {
         self.view.frame = CGRect(x: -(UIScreen.main.bounds.width), y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
         }, completion: { finished in
         self.removeFromParent()
         })*/
        
        /*let transition = CATransition()
         transition.duration = 0.45
         transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
         transition.type = CATransitionType.push
         transition.subtype = CATransitionSubtype.fromRight
         self.navigationController?.view.layer.add(transition, forKey: kCATransition)
         self.navigationController?.popViewController(animated: false)*/
        
        self.dismiss(animated: true, completion: nil)
        
        //self.dismissDetail()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: self.ImgArr[section])
        
        let imageView2 = UIImageView(frame: CGRect(x: self.view.frame.width - 40, y: 20, width: 20, height: 20))
        imageView2.contentMode = .scaleAspectFit
        
        let headerHeading = UILabel(frame: CGRect(x: (imageView.frame.minX + imageView.frame.width) + 20, y: 0, width: self.view.frame.width, height: 60))
        
        if items[section].collapsed
        {
            imageView2.image = UIImage(named: "right-arrow-angle")
        }
        else
        {
            imageView2.image = UIImage(named: "right-arrow")
        }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
        tapGuesture.numberOfTapsRequired = 1
        headerView.addGestureRecognizer(tapGuesture)
        headerView.backgroundColor = UIColor.clear
        headerView.tag = section
        headerHeading.text = items[section].name
        headerHeading.textColor = .white
        headerView.addSubview(headerHeading)
        headerView.addSubview(imageView)
        
        if(section == 5)
        {
            headerView.addSubview(imageView2)
        }
        
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itms = items[section]
        return !itms.collapsed ? 0 : itms.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuVCTblCell") as! MenuVCTblCell
        cell.LblTxt.text = items[indexPath.section].items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DepartmentVC") as! DepartmentVC
            self.navigationController?.pushViewController(vc,animated: false)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DesignationVC") as! DesignationVC
            self.navigationController?.pushViewController(vc,animated: false)
        }
    }
    
    @objc func headerViewTapped(tapped:UITapGestureRecognizer)
    {
        let ind = tapped.view?.tag
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if ind == 0{
            Helper.sharedHelper.tabBarController?.selectedIndex = 0
                     //   isFromSideMenu = true
                       // sideMenuController?.hideMenu()
          //  print(tabBarController!.selectedIndex)
          //  tabBarController!.selectedIndex = 0

          //  self.dismiss(animated: true, completion: nil)
           /* let vc = storyboard.instantiateViewController(withIdentifier: "YourCurrentPlanVC") as! YourCurrentPlanVC
            self.navigationController?.pushViewController(vc,animated: false) */
            (UIApplication.shared.delegate as! AppDelegate).setRootViewController(isTabbar: true)
        }else if ind == 1{
            let vc = storyboard.instantiateViewController(withIdentifier: "SendMessageMenuVC") as! SendMessageMenuVC
            self.navigationController?.pushViewController(vc,animated: false)
            
        }else if ind == 2{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MessageChatVC") as! MessageChatVC
            self.navigationController?.pushViewController(vc,animated: false)
        
        }else if ind == 3{
            let vc = storyboard.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
            self.navigationController?.pushViewController(vc,animated: false)
        }else if ind == 4{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
            self.navigationController?.pushViewController(vc,animated: false)
        }else if ind == 5{
            if items[tapped.view!.tag].collapsed == true{
                items[tapped.view!.tag].collapsed = false
            }else{
                items[tapped.view!.tag].collapsed = true
            }
            MenuVCTbl.reloadData()
        }else if ind == 6{
            var alert = UIAlertController()
            alert = UIAlertController(title: "", message: "Are you sure you want to logout?", preferredStyle: .alert)
            let Yesaction = UIAlertAction(title: "Yes", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
                UserDefaults.standard.setValue("false", forKey: "isLogin")
                (UIApplication.shared.delegate as! AppDelegate).setRootViewController(isTabbar: false)
            }
            let Noaction = UIAlertAction(title: "No", style: .default) { (action) in
            }
            alert.addAction(Yesaction)
            alert.addAction(Noaction)
            self.present(alert, animated: true, completion: nil)
            
            showAlert()
        }
    }
}
