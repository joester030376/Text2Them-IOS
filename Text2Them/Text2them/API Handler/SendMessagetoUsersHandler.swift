//
//  SendMessagetoUsersHandler.swift
//  Text2them
//
//  Created by mac on 19/11/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SendMessagetoUsersHandler
{

    func GetHandler(AdminId:Int,MeesageTouserList : [[String:Any]],MessageText:String,Subject:String,Token:String,Type:Int,UserID:Int,completion:@escaping (SendMessagetoUsersModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        

      //  let param = APIParameter.GetState(Token:Token).dictionary()
       // let param = APIParameter.getContactToUserDropDownList(AdminId: AdminId, Token: Token, Type: Type, UserID: UserID, UserType: UserType).dictionary()

        let param = APIParameter.SendMessagetoUsers(AdminId: AdminId, MeesageTouserList: MeesageTouserList, MessageText: MessageText, Subject: Subject, Token: Token, Type: Type, UserID: UserID).dictionary()
        
       // let param = APIParameter.StaffMemberList(UserID: UserID, Token: Token).dictionary()
     //   APIManager.callApi(API.EditOrganization.requestString(), param: param, method:.post,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
        
        let headers: HTTPHeaders = [
       // "Authorization": "XXXXXX",
        "Accept": "application/json",
        "Content-Type": "application/json",
        ]

        
        APIManager.callApi(API.SendMessagetoUsers.requestString(),  param: param, method:.post, header: headers,encodeType:JSONEncoding.default, isLoader: true) { (code, error, data) in
            
            
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(SendMessagetoUsersModel.self, from: data as! Data)
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







