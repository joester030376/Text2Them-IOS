//
//  SendMessageMenuHandler.swift
//  Text2them
//
//  Created by Pratik on 12/07/21.
//

import Foundation
import Alamofire
import SwiftyJSON


class SendMessageMenuHandler
{
    func GetHandler(NewMessageFirstName:String,NewMessageLastName:String,NewMessageMobileNo:String,NewMessageText:String,UserID:Int,Type:Int,Token:String,completion:@escaping (SendMessageMenuModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
      
        let param = APIParameter.SendMessageFromMenu(NewMessageFirstName: NewMessageFirstName, NewMessageLastName: NewMessageLastName, NewMessageMobileNo: NewMessageMobileNo, NewMessageText: NewMessageText, UserID: UserID, Type: Type, Token: Token).dictionary()
        
        APIManager.callApi(API.SendMessageFromMenu.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
           
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(SendMessageMenuModel.self, from: data as! Data)
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
