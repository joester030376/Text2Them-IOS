//
//  DesignationListHandler.swift
//  Text2them
//
//  Created by mac on 11/05/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class DesignationListHandler
{
    func GetHandler(UserID:Int,Type:Int,Token:String,completion:@escaping (DesignationListModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
        let param = APIParameter.DesignationList(UserID: UserID, Type: Type, Token: Token).dictionary()

        APIManager.callApi(API.DesignationList.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
   
  
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(DesignationListModel.self, from: data as! Data)
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
    
    
    func DeleteHandler(UserID:Int,id:Int,Token:String,completion:@escaping (DesignationListModel?, Error?)-> Void) {
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        let param = APIParameter.DesignationDelete(Id: id, UserID: UserID, Token: Token).dictionary()
        APIManager.callApi(API.DesignationDelete.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(DesignationListModel.self, from: data as! Data)
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
    func AddHandler(UserID:Int,Name:String,Token:String,completion:@escaping (DesignationListModel?, Error?)-> Void) {
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
      //  let param = APIParameter.AddDepartment(Name: Name, UserID: UserID, Token: Token).dictionary()
        let param = APIParameter.DesignationAdd(Name:Name, UserID: UserID, Token: Token).dictionary()
        APIManager.callApi(API.DesignationAdd.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(DesignationListModel.self, from: data as! Data)
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
    
    func EditHandler(UserID:Int,Name:String,Token:String,id:Int,completion:@escaping (DesignationListModel?, Error?)-> Void) {
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
     //   let param = APIParameter.EditDepartment(Name: Name, UserID: UserID, Token: Token, id: id).dictionary()
        let param = APIParameter.DesignationEdit(Id: id, Name: Name, UserID: UserID, Token: Token).dictionary()
      //  APIManager.callApi(API.DesignationEdit.requestString(), param: param, method:.post,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
        APIManager.callApi(API.DesignationEdit.requestString(),param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
        
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(DesignationListModel.self, from: data as! Data)
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







