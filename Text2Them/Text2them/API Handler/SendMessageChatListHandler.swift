//
//  SendMessageChatListHandler.swift
//  Text2them
//
//  Created by Pratik on 02/08/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SendMessageChatListHandler{
    
    func GetHandler(UserId:Int,Type:Int,Token:String,MarketingCampaignGUID:String,AdminId:Int,completion:@escaping (SendMessageChatListModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
       
        let param = APIParameter.getSendMessageChatList(Type: Type, UserID: UserId, Token: Token, MarketingCampaignGUID: MarketingCampaignGUID,AdminId: AdminId).dictionary()
        
        print("========== PARAM ==========\(param)")
        
        APIManager.callApi(API.SendMessageChatList.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(SendMessageChatListModel.self, from: data)
                        completion(ScheduleModels, nil)
                    }
                } catch let error {
                    completion(nil, error)
                }
            }
            else
            {
                completion(nil, error)
            }
        }
    }
}
