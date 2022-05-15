//
//  UsersVCTblCell.swift
//  Text2them
//
//  Created by Admin on 28/04/21.
//

import UIKit

class UsersVCTblCell: UITableViewCell
{
    @IBOutlet weak var BgView: UIView!
    
    @IBOutlet weak var ActiveBtn: UIButton!
    @IBOutlet weak var DeActiveBtn: UIButton!
    @IBOutlet weak var ViewBtn: UIButton!
    @IBOutlet weak var EditBtn: UIButton!
    @IBOutlet weak var DeleteBtn: UIButton!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var departmentNameLbl : UILabel!
    @IBOutlet weak var designationNameLbl : UILabel!
    @IBOutlet weak var phoneNumberLbl : UILabel!
    @IBOutlet weak var btnEditNumber: UIButton!
    @IBOutlet weak var lblDeactive : UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews()
    {
        self.BgView.layer.cornerRadius = 10
    }
    
    
    @IBAction func btnEditNumberClicked(_ sender: Any) {
        
    }
    
}
