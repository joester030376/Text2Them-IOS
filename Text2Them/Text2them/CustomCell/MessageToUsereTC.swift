//
//  MessageToUsereTC.swift
//  Text2them
//
//  Created by pratik joshi on 25/10/21.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func btnCheckTapped(cell: MessageToUsereTC)
}

class MessageToUsereTC: UITableViewCell {

    @IBOutlet weak var btnCheckBox: UIButton!
    
    @IBOutlet weak var lblUseerName: UILabel!
    @IBOutlet weak var lblUserRoal: UILabel!
    @IBOutlet weak var lblUserID: UILabel!
    @IBOutlet weak var lblUserPhoneNumber: UILabel!
    weak var delegate: MyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnCheckTapped(sender: AnyObject) {
           //4. call delegate method
           //check delegate is not nil with `?`
           delegate?.btnCheckTapped(cell: self)
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnCheckBoxClicked(_ sender: Any) {
    }
    
}
