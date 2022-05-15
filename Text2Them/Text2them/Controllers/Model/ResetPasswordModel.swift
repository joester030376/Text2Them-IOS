//
//  ResetPasswordModel.swift
//  Text2Them
//
//  Created by mac on 29/04/21.
//

import Foundation

struct ResetPasswordModel : Codable {
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



class ResetPasswrodViewModel {
    
    let Placholders: placholders = placholders()
    let objForgotPassworHandler = ResetPasswordHandler()
    
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callResetPasswordAPI(OldPassword:String,NewPassword:String,ConfirmPassword:String,id:Int,handler: @escaping ((ResetPasswordModel?, Error?) -> ())) {
        
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
        objForgotPassworHandler.GetHandler(OldPassword: OldPassword, NewPassword: NewPassword, ConfirmPassword: ConfirmPassword, id: id) {(json, Error) in
        //getHandler(EmailId: EmailId) { (json, Error) in
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}



