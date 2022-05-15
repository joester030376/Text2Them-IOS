//
//  EditOrganizationHandler.swift
//  Text2them
//
//  Created by mac on 03/05/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EditOrganizationHandler
{
    func GetHandler(OrganizationId:Int,OrganizationName:String,Description:String,Datapurge:String,website:String,Country:Int,state:Int,city:String,ZipCode:String,UserID:Int,Type:Int,Token:String,completion:@escaping (EditOrganizationModel?, Error?)-> Void) {
        
        if !Reachabilitys.isConnectedToNetwork()
        {
            Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
            return
        }
        
    //    let param = APIParameter.token(grant_type: <#String#>, UserName: UserName, Password: Password).dictionary()
        
      //  let param = APIParameter.forgotPasswordSentMail(Email: UserEmail).dictionary()

        
      //  let param = APIParameter.GetState(Token:Token).dictionary()
      //  let param = APIParameter.EditProfileDetail(Name: Name, LastName: LastName, Email: Email, Password: Password, UserID: UserID, Type: Type, Token: Token).dictionary()
        let param = APIParameter.EditOrganization(OrganizationId: OrganizationId, OrganizationName: OrganizationName, Description: Description, Datapurge: Datapurge, website: website, Country: Country, state: state, city: city, ZipCode: ZipCode, UserID: UserID, Type: Type, Token: Token).dictionary()
        APIManager.callApi(API.EditOrganization.requestString(), param: param, method:.post, header: nil,encodeType: URLEncoding.default, isLoader: true) { (code, error, data) in
            
            if data != nil
            {
                
                do {
                    if let `data` = data {
                        let ScheduleModels = try JSONDecoder().decode(EditOrganizationModel.self, from: data as! Data)
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




