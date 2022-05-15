//
//  NotificationTableViewCell.swift
//  Text2Them
//
//  Created by mac on 21/04/21.
//

import UIKit

protocol NotificationCellDelegate: AnyObject {
    func btnAcceptTapped(cell: NotificationVCTblCell)
}

class NotificationVCTblCell: UITableViewCell {
    
    @IBOutlet weak var lblMassage: UILabel!
    @IBOutlet weak var lblMassageDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    weak var delegate: NotificationCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnAcceptTapped(sender: AnyObject) {
           //4. call delegate method
           //check delegate is not nil with `?`
           delegate?.btnAcceptTapped(cell: self)
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
