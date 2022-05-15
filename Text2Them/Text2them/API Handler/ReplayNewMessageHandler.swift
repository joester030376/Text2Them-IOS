//
//  ReplayNewMessageHandler.swift
//  Text2them
//
//  Created by Pratik on 02/08/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ReplayNewMessageHandler
{
    func GetHandler(CampaignId:Int,CampaignGUID:String,CommunicationGUID:String,ReplyFrom:String,Message:String,UserID:Int,Type:Int,Token:String, AdminId:String,completion:@escaping (ReplayNewMessageModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.ReplyNewMessage(CampaignId: CampaignId, CampaignGUID: CampaignGUID, CommunicationGUID: CommunicationGUID, ReplyFrom: ReplyFrom, Message: Message, UserID: UserID, Type: Type, Token: Token, AdminId: AdminId).dictionary()
        
        APIManager.callApi(API.ReplyNewMessage.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(ReplayNewMessageModel.self, from: data as! Data)
                        completion(ScheduleModels, nil)
                    }
                } catch let error {
                    print(error)
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
