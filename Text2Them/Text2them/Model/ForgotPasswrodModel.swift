//
//  ForgotPasswrodModel.swift
//  WCGTX
//
//  Created by Admin on 26/02/21.
//

import Foundation

struct ForgotPasswordModel : Codable {
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



class ForgotPasswrodViewModel {
    
    let Placholders: placholders = placholders()
    let objForgotPassworHandler = ForgotPasswordHandler()
    
    struct placholders {
        let Email = "Email*"
    }
    
    func callForgotPasswordAPI(EmailId:String,handler: @escaping ((ForgotPasswordModel?, Error?) -> ())) {
        
        objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
        //getHandler(EmailId: EmailId) { (json, Error) in
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}


