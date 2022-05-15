 //
//  GetStateHandler.swift
//  Text2them
//
//  Created by mac on 02/05/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class GetStateHandler
{
    func GetHandler(Token:String,completion:@escaping (GetStateModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
    //    let param = APIParameter.token(grant_type: <#String#>, UserName: UserName, Password: Password).dictionary()
        
      //  let param = APIParameter.forgotPasswordSentMail(Email: UserEmail).dictionary()

        
        let param = APIParameter.GetState(Token:Token).dictionary()
        APIManager.callApi(API.GetState.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(GetStateModel.self, from: data as! Data)
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



