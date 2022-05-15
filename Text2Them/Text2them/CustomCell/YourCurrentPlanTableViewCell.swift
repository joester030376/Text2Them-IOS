//
//  YourCurrentPlanTableViewCell.swift
//  Text2Them
//
//  Created by mac on 22/04/21.
//

import UIKit

class YourCurrentPlanVCTblCell: UITableViewCell {

    @IBOutlet weak var lblPlanName: UILabel!
    @IBOutlet weak var lblPlanEndDate: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
