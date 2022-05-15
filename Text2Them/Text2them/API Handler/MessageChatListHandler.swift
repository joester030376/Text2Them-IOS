//
//  MessageChatListHandler.swift
//  Text2them
//
//  Created by Pratik on 22/07/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class MessageChatListingHandler{
    
    func GetHandler(UserId:Int,Type:Int,Token:String,CommunicationGUID:String,completion:@escaping (MessageChatListModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.getChatListing(Type: Type, UserID: UserId, Token: Token, CommunicationGUID: CommunicationGUID).dictionary()
        print("========== PARAM ==========\(param)")
        
        APIManager.callApi(API.MessageChatList.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(MessageChatListModel.self, from: data)
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
