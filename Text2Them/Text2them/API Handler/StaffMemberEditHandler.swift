//
//  StaffMemberEditHandler.swift
//  Text2them
//
//  Created by mac on 13/05/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class StaffMemberEditHandler
{
    func GetHandler(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool, IP:String,Id:Int,CityName:String,UserID:Int,Type:Int,Token:String,completion:@escaping (StaffMemberEditModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        

      //  let param = APIParameter.GetState(Token:Token).dictionary()

        // let param = APIParameter.View(id: id).dictionary()
        let param = APIParameter.Edit(FirstName: FirstName, LastName: LastName, Department: Department, Designation: Designation, Mobilenumber: Mobilenumber, Email: Email, WorkTimings: WorkTimings, Country: Country, State: State, ZipCode: ZipCode, IsUser: IsUser,IP: IP,Id:Id,  CityName: CityName, UserID: UserID, Type: Type, Token: Token).dictionary()
     //   APIManager.callApi(API.EditOrganization.requestString(), param: param, method:.post,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
        APIManager.callApi(API.Edit.requestString(),  param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            
            
            if data != nil
            {
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(StaffMemberEditModel.self, from: data as! Data)
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






