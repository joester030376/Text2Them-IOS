//
//  ContactMessageListHandler.swift
//  Text2them
//
//  Created by Pratik on 21/07/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ContactMessageListHandler{
    
    func GetHandler(UserId:Int,Type:Int,Token:String,AdminID:Int,completion:@escaping (ContactMessageListModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.getCustomerListing(Type: Type, UserID: UserId, Token: Token, AdminID: AdminID).dictionary()
        APIManager.callApi(API.ContactMessageList.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(ContactMessageListModel.self, from: data)
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
