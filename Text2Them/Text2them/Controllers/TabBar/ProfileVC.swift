//
//  ProfileVC.swift
//  Text2Them
//
//  Created by mac on 20/04/21.
//

import UIKit
import SideMenu
import SDWebImage
import SVProgressHUD
import Alamofire

class ProfileVC: UIViewController
{
    @IBOutlet weak var GradientImgView: UIImageView!
    
    @IBOutlet weak var MainTblView: UITableView!
    
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var FirstNameLbl: UILabel!
    @IBOutlet weak var LastNameLbl: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var DatapurgeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var btnEdit: UIButton!
    let viewModel : GetProfileViewModel = GetProfileViewModel()
    
    var selectedCountryId:Int?
    var selectedStateId:Int?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.profileView.isHidden = true
        callGetProfileAPI(UserID: Int(Session.id)!, Token: Session.token)
        self.setupUI()
        
        DispatchQueue.main.async {
            self.profileView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callGetProfileAPI(UserID: Int(Session.id)!, Token: Session.token)
    }
    override func viewDidAppear(_ animated: Bool)
    {
        MainTblView.setContentOffset(.zero, animated: false)
    }
    override func viewWillLayoutSubviews()
    {
        //self.profileView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        self.profileImgView.RoundCornerViewLayout()
        self.GradientImgView.AddGradientView()
        self.btnEdit.RoundCornerViewLayout()
    }
    private func setupUI()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.ProfileEdited(notification:)), name: Notification.Name("ProfileEdited"), object: nil)
       
        emailLabel.isUserInteractionEnabled = false
        passwordLabel.isUserInteractionEnabled = false
    }
    
    @objc private func ProfileEdited(notification: NSNotification)
    {
        let obj = notification.object as! [String:Any]
        let isEdited = obj["isEdited"] as! Bool
        if(isEdited)
        {
            callGetProfileAPI(UserID: Int(Session.id)!, Token: Session.token)
        }
    }

    @IBAction func EditButtonAction(_ sender: Any)
    {
        btnEdit.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnEdit.backgroundColor = .clear
        btnEdit.layer.borderWidth = 3
        btnEdit.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        
        vc.selectedCountryId = self.selectedCountryId
        vc.selectedStateId = self.selectedStateId
        
        self.navigationController?.pushViewController(vc,animated: false)
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
}


extension ProfileVC
{
    func callGetProfileAPI(UserID:Int,Token:String)
    {
        SVProgressHUD.show()
        viewModel.callGetProfileAPI(UserID: UserID, Token: Token) {  [self] (data, error) in
            SVProgressHUD.dismiss()
            guard let data = data, let object = data.data else {
                return
            }

            let status = data.status ?? (0 != 0)//["status"] as! Int
            if status == true {
                self.profileView.isHidden = false
                
                FirstNameLbl.text = object.name ?? ""
                LastNameLbl.text = object.lastName ?? ""
                emailLabel.text = object.email ?? ""
                passwordLabel.text = object.password ?? ""
                companyNameLabel.text = object.organizationName ?? ""
                descriptionLabel.text = object.description ?? ""
                websiteLabel.text = object.website ?? ""
                DatapurgeLabel.text = object.datapurge ?? ""
                countryLabel.text = object.countryName ?? ""
                stateLabel.text = object.stateName?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                cityLabel.text = object.city ?? ""
                zipcodeLabel.text = object.zipCode ?? ""
                
                self.selectedCountryId = (object.country) ?? 0
                self.selectedStateId = (object.state) ?? 0
                
                if let img = object.profileImage {
                    profileImgView.sd_setShowActivityIndicatorView(true)
                    profileImgView.sd_setIndicatorStyle(.medium)
                    profileImgView.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "Group 180"), options: SDWebImageOptions(rawValue: 0))
                } else {
                    profileImgView.image = UIImage(named: "Group 180")
                }
                
                Session.Description = (object.description)  ?? ""
                Session.Datapurge = (object.datapurge) ?? ""
                Session.website = (object.website) ?? ""
                Session.Country = "\(object.country ?? 0)"
                Session.state = "\(object.state ?? 0))"
                Session.statename = object.stateName?.trimmingCharacters(in: .whitespaces) ?? ""
                Session.userName = object.name ?? ""
                Session.ZipCode = (object.zipCode) ?? ""
                Session.type = "\(object.type ?? 0)"
                
                if let organizationId = object.organizationId {
                    Session.OrganizationId = String(organizationId)
                }
                if let organizationName = object.organizationName {
                    Session.OrganizationName = String(organizationName)
                }
                            
            } else {
              //  Helper.globalAlert(msg: message)
            }
        }
    }
}


