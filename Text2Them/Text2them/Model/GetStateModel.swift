//
//  GetStateModel.swift
//  Text2them
//
//  Created by mac on 30/04/21.
//

import Foundation


struct GetStateModel : Codable {
let message : String?
let strStatus : String?
let status : Bool?
let data : DataState?

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
    data = try values.decodeIfPresent(DataState.self, forKey: .data)
}

}

struct DataState : Codable {
    let stateList : [StateList]?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case stateList = "stateList"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stateList = try values.decodeIfPresent([StateList].self, forKey: .stateList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct StateList : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "Name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

class GetStateViewModel {
    
    let Placholders: placholders = placholders()
    let objGetStateHandler = GetStateHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
   // func callGetCountryAPI(Token:String,handler: @escaping ((GetStateModel?, Error?) -> ())) {
    
    func callGetStateAPI(Token:String,handler: @escaping ((GetStateModel?, Error?) -> ())) {
        
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
      //  objForgotPassworHandler.GetHandler(OldPassword: OldPassword, NewPassword: NewPassword, ConfirmPassword: ConfirmPassword, id: id) {(json, Error) in
      //  objGetCountryHandler.GetHandler(Token: Token) {(json, Error) in
        objGetStateHandler.GetHandler(Token: Token) {(json, Error) in
      
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}





