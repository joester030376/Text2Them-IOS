//
//  ForgotPassworHandler.swift
//  Text2Them
//
//  Created by mac on 28/04/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ForgotPasswordHandler
{
    func GetHandler(UserEmail:String,completion:@escaping (ForgotPasswordModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
    //    let param = APIParameter.token(grant_type: <#String#>, UserName: UserName, Password: Password).dictionary()
        
      //  let param = APIParameter.login(Email: UserEmail).dictionary()
        let param = APIParameter.forgotPasswordSentMail(Email: UserEmail).dictionary()
        
        APIManager.callApi(API.forgotPasswordSentMail.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(ForgotPasswordModel.self, from: data as! Data)
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
                // print(json)
                //let dict = json.dictionaryValue[StaticNameOfVariable.Vdata]!.dictionaryValue
                //let errorMessage = json.dictionaryValue[StatusErrorMessade.response_message]?.stringValue
                // Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: errorMessage!)
            }
        }
    }
    
}

