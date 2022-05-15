//
//  SendVC.swift
//  Text2Them
//
//  Created by mac on 21/04/21.
//

import UIKit

class SendMessageVC: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var SendMessageVCTbl: UITableView!
    
    var arr = ["1","2","3"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SendMessageVCTblCell", for: indexPath)as! SendMessageVCTblCell
        return cell
    }
}
