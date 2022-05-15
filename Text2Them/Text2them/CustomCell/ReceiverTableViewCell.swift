//
//  ReceiverTableViewCell.swift
//  AstroZap
//
//  Created by XcelTec-037 on 11/15/19.
//  Copyright © 2019 XcelTec-037. All rights reserved.
//

import UIKit

class ReceiverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTimeReceiver: UILabel!
    @IBOutlet weak var lblChat: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
