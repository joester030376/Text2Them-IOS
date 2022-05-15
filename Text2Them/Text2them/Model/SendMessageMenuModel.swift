//
//  SendMessageMenuModel.swift
//  Text2them
//
//  Created by Pratik on 12/07/21.
//

import Foundation

struct SendMessageMenuModel : Codable{
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


class SendMessageMenuViewModel {
    
    let objSendMessageMenuHandler = SendMessageMenuHandler()
    
    func callSendSmsFromMenuAPI(NewMessageFirstName:String,NewMessageLastName:String,NewMessageMobileNo:String,NewMessageText:String,UserID:Int,Type:Int,Token:String,handler: @escaping((SendMessageMenuModel?, Error?) -> ())) {
        
        objSendMessageMenuHandler.GetHandler(NewMessageFirstName: NewMessageFirstName, NewMessageLastName: NewMessageLastName, NewMessageMobileNo: NewMessageMobileNo, NewMessageText: NewMessageText, UserID: UserID, Type: Type, Token: Token) { (json, Error) in
            
            guard let model = json else{
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}
