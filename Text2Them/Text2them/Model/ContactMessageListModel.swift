//
//  ContactMessageListModel.swift
//  Text2them
//
//  Created by Pratik on 21/07/21.
//

import Foundation
struct ContactMessageListModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : [DataContactMessage]
    
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
        data = try values.decodeIfPresent([DataContactMessage].self, forKey: .data)!
    }
}

struct DataContactMessage  : Codable {
    let If : Int?
    let FullName : String?
    let FirstName : String?
    let LastName : String?
    let MobileNumber : String?
    let NetworkEmailId : String?
    let CommunicationGUID : String?
    let UserID : Int?
    let AdminId : Int?
    let Token : Int?
    let type : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case If = "If"
        case FullName = "FullName"
        case FirstName = "FirstName"
        case LastName = "LastName"
        case MobileNumber = "MobileNumber"
        case NetworkEmailId = "NetworkEmailId"
        case CommunicationGUID = "CommunicationGUID"
        case UserID = "UserID"
        case AdminId = "AdminId"
        case Token = "Token"
        case type = "Type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        If = try values.decodeIfPresent(Int.self, forKey: .If)
        FullName = try values.decodeIfPresent(String.self, forKey: .FullName)
        FirstName = try values.decodeIfPresent(String.self, forKey: .FirstName)
        LastName = try values.decodeIfPresent(String.self, forKey: .LastName)
        MobileNumber = try values.decodeIfPresent(String.self, forKey: .MobileNumber)
        NetworkEmailId = try values.decodeIfPresent(String.self, forKey: .NetworkEmailId)
        CommunicationGUID = try values.decodeIfPresent(String.self, forKey: .CommunicationGUID)
        UserID = try values.decodeIfPresent(Int.self, forKey: .UserID)
        Token = try values.decodeIfPresent(Int.self, forKey: .Token)
        AdminId = try values.decodeIfPresent(Int.self, forKey: .AdminId)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
    }
}

class ContactListHandler {
    
    let objHandler = ContactMessageListHandler()
    
    func callGetContactMessageList(UserId: Int, Type: Int,Token: String ,AdminID: Int ,handler: @escaping ((ContactMessageListModel?, Error?) -> ())) {
        objHandler.GetHandler(UserId: UserId, Type: Type, Token: Token, AdminID: AdminID) { (ContactMessageListModel, Error) in
            guard let model = ContactMessageListModel else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}
