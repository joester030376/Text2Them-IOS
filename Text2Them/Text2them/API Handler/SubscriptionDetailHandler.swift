//
//  SubscriptionDetailHandler.swift
//  Text2them
//
//  Created by Pratik on 30/06/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SubscriptionDetailHandler{
    
    func GetHandler(UserId:Int,Type:String,completion:@escaping (SubscriptionDetailModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.subscriptionDetail(UserId: UserId, Type: Type).dictionary()
        APIManager.callApi(API.SubscriptionDetail.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(SubscriptionDetailModel.self, from: data)
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



