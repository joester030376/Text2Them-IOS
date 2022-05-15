//
//  MessageChatVC.swift
//  Text2Them
//
//  Created by mac on 23/04/21.
//

import UIKit
import SideMenu

class MessageChatVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var txtSelectUser: UITextField!
    @IBOutlet weak var tblMain: UITableView!
    
    var arrContactList = [String]()
    var arrContactListCommunicationID = [String]()
    
    var arrChatListingData = [ChatList]()
    var arrSendMessageList = [SendmessageList]()
    
    var viewModelContactListHandler : ContactListHandler = ContactListHandler()
    var viewModelCheckMessageListHandler : MessageChatListingHandler = MessageChatListingHandler()
    var viewModelSendMessageChatListHandler : SendMessageChatListHandler = SendMessageChatListHandler()
    var ReplayNewMessageHandlerHandler :  ReplayNewMessageHandler = ReplayNewMessageHandler()
    var isSenderOnly = false
    
    var intCampaignId = Int()
    var strCampaignGUID  = String()
    var communicationGUID = String()
    var strCommunicationGUID = String()
    var strReplyFrom = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextView.text = "Message"
        messageTextView.textColor =  .darkGray
        messageTextView.delegate = self
        
        txtSelectUser.layer.borderWidth = 1
        txtSelectUser.delegate = self
        txtSelectUser.layer.borderColor = UIColor.black.cgColor
        
        getContactMessageList()
    }
    
    @IBAction func MenuButtonAction(_ sender: UIButton)
    {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func btnSendMessageClicked(_ sender: UIButton)
    {
        if !strCommunicationGUID.isEmpty{
            if !messageTextView.text.isEmpty{
                sendReplayMessage()
            }
        }
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func notificationButtonAction(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc,animated: false)
    }
    
    // MARK: ===================== TextField Method ========================== //
    func textViewDidBeginEditing(_ textView: UITextView) {
        if messageTextView.text == "Message" {
            messageTextView.text = ""
            messageTextView.textColor = UIColor.black
            messageTextView.font = UIFont(name: "verdana", size: 18.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            messageTextView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if messageTextView.text == "" {
            messageTextView.text = "Message"
            messageTextView.textColor = UIColor.lightGray
            messageTextView.font = UIFont(name: "verdana", size: 13.0)
        }
    }
}

// MARK: ===================== TableviewMethod ========================== //
extension MessageChatVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSenderOnly{
            return arrSendMessageList.count
        }else{
            return arrChatListingData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSenderOnly{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "SenderTableViewCell", for: indexPath) as! SenderTableViewCell
            cell1.lblChat.text = arrSendMessageList[indexPath.row].message
            cell1.lblUserName.layer.borderWidth = 1
            cell1.lblUserName.layer.borderColor = UIColor.black.cgColor
            cell1.lblUserName.layer.cornerRadius = cell1.lblUserName.frame.width / 2
            cell1.lblUserName.layer.masksToBounds = true
            return cell1
        }else{
            if arrChatListingData[indexPath.row].sender == true{
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "SenderTableViewCell", for: indexPath) as! SenderTableViewCell
                cell1.lblChat.text = arrChatListingData[indexPath.row].messageContent
                cell1.lblUserName.layer.borderWidth = 1
                cell1.lblUserName.layer.borderColor = UIColor.black.cgColor
                cell1.lblUserName.layer.cornerRadius = cell1.lblUserName.frame.width / 2
                cell1.lblUserName.layer.masksToBounds = true
                cell1.lblTimeSender.text = getMesageTime(strDate: arrChatListingData[indexPath.row].messageDate!)
                
                return cell1
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverTableViewCell", for: indexPath) as! ReceiverTableViewCell
                cell.lblChat.text = arrChatListingData[indexPath.row].messageContent
                
                cell.lblUserName.layer.borderWidth = 1
                cell.lblUserName.layer.borderColor = UIColor.black.cgColor
                cell.lblUserName.layer.cornerRadius = cell.lblUserName.frame.width / 2
                cell.lblUserName.layer.masksToBounds = true
                cell.lblTimeReceiver.text = getMesageTime(strDate: arrChatListingData[indexPath.row].messageDate!)
                
                return cell
            }
        }
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            self.tblMain.scrollsToBottom(animated: false)
        }
    }
    
    func getMesageTime(strDate:String) -> String{
        var strTime = String()
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm a"
        if let date = dateFormatterGet.date(from: strDate) {
            strTime = dateFormatterPrint.string(from: date)
        }
        return strTime
    }
    
    // MARK: ==================== TEXT FIELD DELEGATE METHOD ===========================
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtSelectUser{
            actionSheetTask(textField)
            return false
        }
        return false
    }
    
    // MARK: ===================== ActionSheet ========================== //
    @IBAction func actionSheetTask(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Please Select", message: nil, preferredStyle: .actionSheet)
        
        for i in 0..<self.arrContactList.count {
            
            //..Add Action
            alertController.addAction(UIAlertAction(title: arrContactList[i] , style: .default, handler: { (action) -> Void in
                self.txtSelectUser.text = self.arrContactList[i]
                self.strCommunicationGUID = self.arrContactListCommunicationID[i]
                self.getMessageListIfAvailable()
            }))
        }
        //..CancelButton
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in
        }))
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            
            popoverController.permittedArrowDirections = []
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: ===================== Webservice Calling ========================== //

extension MessageChatVC{
    func getContactMessageList(){
        viewModelContactListHandler.callGetContactMessageList(UserId: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token, AdminID:  Int(Session.AdminId)!) { (ContactMessageListModel, Error) in
            
            if (ContactMessageListModel?.status)!{
                self.arrContactList = (ContactMessageListModel?.data.map({$0.FullName ?? ""}))!
                self.arrContactListCommunicationID = (ContactMessageListModel?.data.map({$0.CommunicationGUID ?? ""}))!
            }else{
                self.view?.makeToast(ContactMessageListModel?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    func getMessageListIfAvailable(){
        //   viewModelCheckMessageListHandler.callGetContactMessageList(UserId: /*Int(Session.id)!*/70, Type: Int(Session.type)!, Token: "62e1f167-3a64-4e9f-b665-04feec0fd29f"/*Session.token*/, CommunicationGUID: /*strCommunicationGUID*/"d13221bb-be5b-416a-a3c3-6e4865cc72a4@txtmsgnow.com") {(messageChatListModel, Error) in
        
        
        viewModelCheckMessageListHandler.GetHandler(UserId: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token, CommunicationGUID: strCommunicationGUID) {(messageChatListModel, Error) in
      //  viewModelCheckMessageListHandler.GetHandler(UserId: <#T##Int#>, Type: <#T##Int#>, Token: <#T##String#>, CommunicationGUID: <#T##String#>, completion: <#T##(MessageChatListModel?, Error?) -> Void#>)
            if let status = messageChatListModel?.status,
               status{
                if let arrChatList = messageChatListModel?.data?.chatList{
                    self.arrChatListingData = [ChatList]()
                    self.arrChatListingData = arrChatList
                    
                    if let strReplyFrom = messageChatListModel?.data?.replyFrom{
                        
                        self.intCampaignId = (messageChatListModel?.data?.campaignId)!
                        self.strCampaignGUID = (messageChatListModel?.data?.campaignGUID) as! String
                        self.communicationGUID = (messageChatListModel?.data?.communicationGUID) as! String
                        self.strReplyFrom = (messageChatListModel?.data?.replyFrom) as! String
                        
                        for i in 0..<self.arrChatListingData.count{
                            let ReplyFrom = self.arrChatListingData[i].replyFrom
                            
                            if strReplyFrom == ReplyFrom{
                                self.arrChatListingData[i].sender = true
                            }else{
                                self.arrChatListingData[i].sender = false
                            }
                        }
                    }
                    if self.arrChatListingData.count != 0{
                        DispatchQueue.main.async {
                            self.messageTextView.text = ""
                            self.tblMain.isHidden = false
                            self.isSenderOnly = false
                            self.tblMain.reloadData()
                            self.scrollToBottom()
                        }
                    }else{
                        self.tblMain.isHidden = true
                    }
                }else{
                    print("call webservice")
                    self.isSenderOnly = true
                    self.getSendMessageChatList()
                }
            }else{
                self.view?.makeToast("Something Want Wrong", duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    func getSendMessageChatList(){
        
        viewModelSendMessageChatListHandler.GetHandler(UserId: Int(Session.id)!, Type: Int(Session.type)!, Token: Session.token, MarketingCampaignGUID: strCommunicationGUID, AdminId: Int(Session.AdminId)!) { (SendMessageChatListModel, Error) in
            
            if (SendMessageChatListModel?.status)!{
                if SendMessageChatListModel?.data?.sendmessageList != nil{
                    self.arrSendMessageList = (SendMessageChatListModel?.data?.sendmessageList!)!
                    if self.arrSendMessageList.count != 0{
                        DispatchQueue.main.async {
                            self.tblMain.isHidden = false
                            self.tblMain.reloadData()
                            self.scrollToBottom()
                        }
                    }else{
                        self.tblMain.isHidden = true
                    }
                }else{
                    self.tblMain.isHidden = true
                }
            }else{
                self.view?.makeToast(SendMessageChatListModel?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
    
    func sendReplayMessage(){
        ReplayNewMessageHandlerHandler.GetHandler(CampaignId: intCampaignId, CampaignGUID: strCampaignGUID, CommunicationGUID: communicationGUID, ReplyFrom: strReplyFrom, Message: messageTextView.text, UserID:  Int(Session.id)!, Type: 0, Token: "", AdminId: "") { (ReplayNewMessageModel, Error) in
            
            if (ReplayNewMessageModel?.status)!{
                self.getMessageListIfAvailable()
            }else{
                self.view?.makeToast(ReplayNewMessageModel?.message, duration: TOAST_TIME, position: .bottom)
            }
        }
    }
}
