//
//  loginModel.swift
//  Text2Them
//
//  Created by mac on 23/04/21.
//

import UIKit

import Foundation
struct loginModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataLogin?

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
        data = try values.decodeIfPresent(DataLogin.self, forKey: .data)
    }

}


struct DataLogin : Codable {
    let email : String?
    let password : String?
    let id : Int?
    let userName : String?
    let token : String?
    let type : Int?
    let oTP : String?
    let profileImage : String?
    let AdminId : Int?
    
    enum CodingKeys: String, CodingKey {

        case email = "Email"
        case password = "Password"
        case id = "Id"
        case userName = "UserName"
        case token = "Token"
        case type = "type"
        case oTP = "OTP"
        case profileImage = "ProfileImage"
        case AdminId = "AdminId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        oTP = try values.decodeIfPresent(String.self, forKey: .oTP)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        AdminId = try values.decodeIfPresent(Int.self, forKey: .AdminId)
    }

}


class LoginViewModel {
    
    let Placholders: placholders = placholders()
    let objLoginHandler = LoginHandler()
    
    
    struct placholders {
        let Email = "Email"
        let Password = "Password"
    }
    
    func callLoginAPI(Email: String, Password: String,handler: @escaping ((loginModel?, Error?) -> ())) {
      
        objLoginHandler.GetHandler(UserEmail: Email, Password: Password) { (loginModel, Error) in
     
      //  GetHandler(UserName: UserName, Password: Password){ (loginModel, Error) in
      
                  guard let model = loginModel else {
      
                      handler(nil, Error)
                      return
                  }
                  handler(model, Error)
              }
          }
    }

