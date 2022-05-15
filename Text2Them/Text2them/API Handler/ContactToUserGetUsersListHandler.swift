//
//  ContactToUserGetUsersListHandler.swift
//  Text2them
//
//  Created by mac on 18/11/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ContactToUserGetUsersListHandler
{
    func GetHandler(AdminId:Int,ContactGroup:Int,Departmentid:Int,Designationid:Int,Token:String,Type:Int,UserID:Int,UserType:Int,completion:@escaping (ContactToUserGetUsersListModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        

      //  let param = APIParameter.GetState(Token:Token).dictionary()
       // let param = APIParameter.getContactToUserDropDownList(AdminId: AdminId, Token: Token, Type: Type, UserID: UserID, UserType: UserType).dictionary()
        
        let param = APIParameter.getContactToUserGetUsersList(AdminId: AdminId, ContactGroup: ContactGroup, Departmentid: Departmentid, Designationid: Designationid, Token: Token, Type: Type, UserID: UserID, UserType: UserType).dictionary()
        
       // let param = APIParameter.StaffMemberList(UserID: UserID, Token: Token).dictionary()
     //   APIManager.callApi(API.EditOrganization.requestString(), param: param, method:.post,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
        
        
        APIManager.callApi(API.getContactToUserGetUsersList.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(ContactToUserGetUsersListModel.self, from: data as! Data)
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






