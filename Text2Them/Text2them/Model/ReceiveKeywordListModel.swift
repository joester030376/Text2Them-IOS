//
//  ReceiveKeywordListModel.swift
//  Text2them
//
//  Created by mac on 25/11/21.
//

import Foundation
struct ReceiveKeywordListModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : [DataReceiveKeywordList]?

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
        data = try values.decodeIfPresent([DataReceiveKeywordList].self, forKey: .data)
    }

}

struct DataReceiveKeywordList : Codable {
    let comuncationId : Int?
    let campaignId : Int?
    let campaignName : String?
    let campaignGUID : String?
    let communicationGUID : String?
    let messageDate : String?
    let fullname : String?
    let customerId : Int?
    let supportId : Int?
    let messageContent : String?
    let replyFrom : String?
    let keyword : String?
    let userID : Int?
    let type : Int?
    let adminId : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case comuncationId = "ComuncationId"
        case campaignId = "CampaignId"
        case campaignName = "CampaignName"
        case campaignGUID = "CampaignGUID"
        case communicationGUID = "CommunicationGUID"
        case messageDate = "MessageDate"
        case fullname = "Fullname"
        case customerId = "CustomerId"
        case supportId = "SupportId"
        case messageContent = "MessageContent"
        case replyFrom = "ReplyFrom"
        case keyword = "Keyword"
        case userID = "UserID"
        case type = "Type"
        case adminId = "AdminId"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        comuncationId = try values.decodeIfPresent(Int.self, forKey: .comuncationId)
        campaignId = try values.decodeIfPresent(Int.self, forKey: .campaignId)
        campaignName = try values.decodeIfPresent(String.self, forKey: .campaignName)
        campaignGUID = try values.decodeIfPresent(String.self, forKey: .campaignGUID)
        communicationGUID = try values.decodeIfPresent(String.self, forKey: .communicationGUID)
        messageDate = try values.decodeIfPresent(String.self, forKey: .messageDate)
        fullname = try values.decodeIfPresent(String.self, forKey: .fullname)
        customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
        supportId = try values.decodeIfPresent(Int.self, forKey: .supportId)
        messageContent = try values.decodeIfPresent(String.self, forKey: .messageContent)
        replyFrom = try values.decodeIfPresent(String.self, forKey: .replyFrom)
        keyword = try values.decodeIfPresent(String.self, forKey: .keyword)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}


class ReceiveKeywordListViewModel{
    
    let objHandler = ReceiveKeywordListHandler()
    
    func callReceiveKeywordList(UserId:Int,Type:Int,AdminID:Int,Token:String ,handler: @escaping ((ReceiveKeywordListModel?, Error?) -> ())) {
        
      //  objHandler.GetHandler(UserId: UserId, Type: Type, Token: Token, MarketingCampaignGUID: MarketingCampaignGUID, AdminId: AdminID) { (SendMessageChatListModel, Error) in
            
            objHandler.GetHandler(UserId: UserId, Type: Type, AdminId: AdminID, Token: Token) { (ReceiveKeywordListModel, Error) in
             
            
            guard let model = ReceiveKeywordListModel else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}

