//
//  GetCountryModel.swift
//  Text2them
//
//  Created by mac on 30/04/21.
//

import Foundation

struct GetCountryModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataCountry?

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
        data = try values.decodeIfPresent(DataCountry.self, forKey: .data)
    }

}

struct DataCountry : Codable {
    let countryList : [CountryList]?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case countryList = "countryList"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countryList = try values.decodeIfPresent([CountryList].self, forKey: .countryList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct CountryList : Codable {
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

class GetCountryViewModel {
    
    let Placholders: placholders = placholders()
    let objGetCountryHandler = GetCountryHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callGetCountryAPI(Token:String,handler: @escaping ((GetCountryModel?, Error?) -> ())) {
        
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
      //  objForgotPassworHandler.GetHandler(OldPassword: OldPassword, NewPassword: NewPassword, ConfirmPassword: ConfirmPassword, id: id) {(json, Error) in
        objGetCountryHandler.GetHandler(Token: Token) {(json, Error) in
       
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}




