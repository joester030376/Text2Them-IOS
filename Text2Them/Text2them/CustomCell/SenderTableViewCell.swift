//
//  SenderTableViewCell.swift
//  Text2Them
//
//  Created by mac on 23/04/21.
//

import UIKit

class SenderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTimeSender: UILabel!
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
