//
//  AcceptKeywordHandler.swift
//  Text2them
//
//  Created by mac on 25/11/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class AcceptKeywordHandler{
    
    func GetHandler(UserId:Int,Type:Int,AdminId:Int,Token:String,CampaignGUID:String,ReplyFrom:String,completion:@escaping (AcceptKeywordModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
       
        //let param = APIParameter.getSendMessageChatList(UserID: UserId,Type: Type,AdminId: AdminId, MarketingCampaignGUID: <#String#>,Token: Token).dictionary()
        let param = APIParameter.AcceptKeyword(UserID: UserId, Type: Type, AdminId: AdminId, Token: Token, CampaignGUID: CampaignGUID, ReplyFrom: ReplyFrom).dictionary()
        print("========== PARAM ==========\(param)")
        
        APIManager.callApi(API.AcceptKeyword.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(AcceptKeywordModel.self, from: data)
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




