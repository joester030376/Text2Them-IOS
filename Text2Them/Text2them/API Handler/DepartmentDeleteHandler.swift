//
//  DepartmentDeleteHandler.swift
//  Text2them
//
//  Created by Admin on 14/05/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DepartmentDeleteHandler
{
    func DeleteHandler(id:Int,UserID:Int,Token:String,completion:@escaping (StaffMemberViewModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.DeleteDepartment(id: id, UserID: UserID, Token: Token).dictionary()
        APIManager.callApi(API.DeleteDepartment.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(StaffMemberViewModel.self, from: data as! Data)
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
    func AddHandler(Name:String,UserID:Int,Token:String,completion:@escaping (StaffMemberViewModel?, Error?)-> Void) {
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.AddDepartment(Name: Name, UserID: UserID, Token: Token).dictionary()
        APIManager.callApi(API.AddDepartment.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(StaffMemberViewModel.self, from: data as! Data)
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





