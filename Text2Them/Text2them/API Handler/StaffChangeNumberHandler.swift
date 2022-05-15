//
//  StaffChangeNumberHandler.swift
//  Text2them
//
//  Created by Pratik on 02/07/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class StaffChangeNumberHandler
{
    func GetHandler(UserID:Int, StaffmemberId:Int, Mobilenumber:String, Token:String,completion:@escaping (DepartmentDeleteModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        

      //  let param = APIParameter.GetState(Token:Token).dictionary()

        let param = APIParameter.staffChnageNumber(UserId: UserID, StaffmemberId: StaffmemberId, Mobilenumber: Mobilenumber, Token: Token).dictionary()
   
        APIManager.callApi(API.StaffChangeNumber.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(DepartmentDeleteModel.self, from: data as! Data)
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





