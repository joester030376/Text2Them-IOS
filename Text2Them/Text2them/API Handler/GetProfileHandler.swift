//
//  GetProfileHandler.swift
//  Text2Them
//
//  Created by mac on 29/04/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class GetProfileHandler {

    func GetHandler(UserID:Int,Token:String,completion:@escaping (GetProfileModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
    //    let param = APIParameter.token(grant_type: <#String#>, UserName: UserName, Password: Password).dictionary()
        
      //  let param = APIParameter.forgotPasswordSentMail(Email: UserEmail).dictionary()
       // let param = APIParameter.ResetPassword(OldPassword: OldPassword, NewPassword: NewPassword, ConfirmPassword: ConfirmPassword, id: id).dictionary()
        let param = APIParameter.GetProfile(UserID: UserID, Token: Token).dictionary()
        APIManager.callApi(API.GetProfile.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            print(param)
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(GetProfileModel.self, from: data as! Data)
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

