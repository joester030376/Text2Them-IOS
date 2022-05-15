//
//  DepartmentVCTblCell.swift
//  Text2them
//
//  Created by Admin on 14/05/21.
//

import UIKit

class DepartmentVCTblCell: UITableViewCell {

    @IBOutlet weak var BgView: UIView!
    
    @IBOutlet weak var EditBtn: UIButton!
    @IBOutlet weak var DeleteBtn: UIButton!
    @IBOutlet weak var DepartmentLbl : UILabel!
    @IBOutlet weak var DepartmentNameLbl : UILabel!

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

}
