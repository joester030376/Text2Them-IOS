//
//  LoginHandler.swift
//  WCGTX
//
//  Created by keval dattani on 19/01/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class LoginHandler
{
    func GetHandler(UserEmail:String,Password:String,completion:@escaping (loginModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
    //    let param = APIParameter.token(grant_type: <#String#>, UserName: UserName, Password: Password).dictionary()
        
        let param = APIParameter.login(Email: UserEmail, Password: Password).dictionary()
        
        APIManager.callApi(API.login.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(loginModel.self, from: data)
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
