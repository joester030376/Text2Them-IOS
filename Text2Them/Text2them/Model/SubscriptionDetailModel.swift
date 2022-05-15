//
//  SubscriptionDetailModel.swift
//  Text2them
//
//  Created by Pratik on 30/06/21.
//

import Foundation

struct SubscriptionDetailModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataSub?
    
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
        data = try values.decodeIfPresent(DataSub.self, forKey: .data)
    }
}

struct DataSub  : Codable {
    let AdminId : Int?
    let type : Int?
    let UserID : Int?
    let usersubscriptionList : [DataSubscriptionDetail]?
    
    enum CodingKeys: String, CodingKey {
        
        case AdminId = "AdminId"
        case type = "Type"
        case UserID = "UserID"
        case usersubscriptionList = "usersubscriptionList"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        AdminId = try values.decodeIfPresent(Int.self, forKey: .AdminId)
        //Token = try values.decodeIfPresent(String.self, forKey: .Token)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        UserID = try values.decodeIfPresent(Int.self, forKey: .UserID)
        usersubscriptionList = try values.decodeIfPresent([DataSubscriptionDetail].self, forKey: .usersubscriptionList)
    }
}

struct DataSubscriptionDetail : Codable {
    let UserId : Int?
    let SubscriptionRangeId : Int?
    let SubscriptionEndDate : String?
    let PlanName : String?
    let ContactRangeStart : Int?
    let ContactRangeEnd : Int?
    let UserID : Int?
    let type : Int?
    let AdminId : Int?
    //let Token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case UserId = "UserId"
        case UserID = "UserID"
        case SubscriptionRangeId = "SubscriptionRangeId"
        case SubscriptionEndDate = "SubscriptionEndDate"
        case PlanName = "PlanName"
        case ContactRangeStart = "ContactRangeStart"
        case ContactRangeEnd = "ContactRangeEnd"
        case type = "Type"
        case AdminId = "AdminId"
        // case Token = "Token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        UserId = try values.decodeIfPresent(Int.self, forKey: .UserId)
        UserID = try values.decodeIfPresent(Int.self, forKey: .UserID)
        SubscriptionRangeId = try values.decodeIfPresent(Int.self, forKey: .SubscriptionRangeId)
        SubscriptionEndDate = try values.decodeIfPresent(String.self, forKey: .SubscriptionEndDate)
        PlanName = try values.decodeIfPresent(String.self, forKey: .PlanName)
        ContactRangeStart = try values.decodeIfPresent(Int.self, forKey: .ContactRangeStart)
        ContactRangeEnd = try values.decodeIfPresent(Int.self, forKey: .ContactRangeEnd)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        AdminId = try values.decodeIfPresent(Int.self, forKey: .AdminId)
        // Token = try values.decodeIfPresent(String.self, forKey: .Token)
    }
}


class SubscriptionDetailViewModel {
    
    let Placholders: placholders = placholders()
    let objHandler = SubscriptionDetailHandler()
    
    struct placholders {
        let UserId = "UserId"
        let type = "Type"
    }
    
    func callSubscriptionDetail(UserId: Int, Type: String,handler: @escaping ((SubscriptionDetailModel?, Error?) -> ())) {
        
        objHandler.GetHandler(UserId: UserId, Type: Type) { (SubscriptionDetailModel, Error) in
            guard let model = SubscriptionDetailModel else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}

