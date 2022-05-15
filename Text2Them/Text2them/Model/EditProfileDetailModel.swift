//
//  EditProfileDetailModel.swift
//  Text2them
//
//  Created by mac on 03/05/21.
//

import Foundation

struct EditProfileDetailModel: Codable {
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


class EditProfileDetailViewModel {
    
    let Placholders: placholders = placholders()
    let objEditProfileDetailHandler = EditProfileDetailHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callEditProfileDetailAPI(Name:String,LastName:String,Email:String,Password:String,UserID:Int,Type:Int,  Token:String,handler: @escaping ((EditProfileDetailModel?, Error?) -> ())) {
        
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  
        objEditProfileDetailHandler.GetHandler(Name: Name, LastName: LastName, Email: Email, Password: Password, UserID: UserID, Type: Type, Token: Token) { (json, Error) in
     
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





