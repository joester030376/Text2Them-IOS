//
//  EditOrganizationModel.swift
//  Text2them
//
//  Created by mac on 03/05/21.
//

import Foundation

struct EditOrganizationModel: Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : String?

    enum CodingKeys: String, CodingKey {

        case message = "Message"
        case strStatus = "strStatus"
        case status = "Status"
        case data = "Data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        strStatus = try values.decodeIfPresent(String.self, forKey: .strStatus)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(String.self, forKey: .data)
    }

}


class EditOrganizationViewModel {
    
    let Placholders: placholders = placholders()
    let objEditOrganizationHandler = EditOrganizationHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callEditOrganizationAPI(OrganizationId:Int,OrganizationName:String,Description:String,Datapurge:String,website:String,Country:Int,state:Int,city:String,ZipCode:String,UserID:Int,Type:Int,Token:String,handler: @escaping ((EditOrganizationModel?, Error?) -> ())) {
        
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  
 
        objEditOrganizationHandler.GetHandler(OrganizationId: OrganizationId, OrganizationName: OrganizationName, Description: Description, Datapurge: Datapurge, website: website, Country: Country, state: state, city: city, ZipCode: ZipCode, UserID: UserID, Type: Type, Token: Token){ (json, Error) in
     
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





