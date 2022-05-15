//
//  SendMessageChatListModel.swift
//  Text2them
//
//  Created by Pratik on 02/08/21.
//

import Foundation
struct SendMessageChatListModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataChaSendListing?
    
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
        data = try values.decodeIfPresent(DataChaSendListing?.self, forKey: .data)!
    }
}

struct DataChaSendListing : Codable {
    let sendmessageList : [SendmessageList]?
    let marketingCampaignGUID : String?
    let senderNetworkEmailId : String?
    let userID : Int?
    let type : Int?
    let adminId : Int?
    let token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case sendmessageList = "sendmessageList"
        case marketingCampaignGUID = "MarketingCampaignGUID"
        case senderNetworkEmailId = "SenderNetworkEmailId"
        case userID = "UserID"
        case type = "Type"
        case adminId = "AdminId"
        case token = "Token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sendmessageList = try values.decodeIfPresent([SendmessageList].self, forKey: .sendmessageList)
        marketingCampaignGUID = try values.decodeIfPresent(String.self, forKey: .marketingCampaignGUID)
        senderNetworkEmailId = try values.decodeIfPresent(String.self, forKey: .senderNetworkEmailId)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
}

struct SendmessageList : Codable {
    let id : Int?
    let marketingCampaignId : Int?
    let campaingName : String?
    let marketingCampaignGUID : String?
    let senderNetworkid : String?
    let message : String?
    let adminId : Int?
    let createdBy : Int?
    let firstName : String?
    let lastName : String?
    let createdDate : String?
    let createdDateTimeStr : String?
    let modifyedBy : Int?
    let modifiedDate : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "Id"
        case marketingCampaignId = "MarketingCampaignId"
        case campaingName = "CampaingName"
        case marketingCampaignGUID = "MarketingCampaignGUID"
        case senderNetworkid = "SenderNetworkid"
        case message = "Message"
        case adminId = "AdminId"
        case createdBy = "CreatedBy"
        case firstName = "FirstName"
        case lastName = "LastName"
        case createdDate = "CreatedDate"
        case createdDateTimeStr = "CreatedDateTimeStr"
        case modifyedBy = "ModifyedBy"
        case modifiedDate = "ModifiedDate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        marketingCampaignId = try values.decodeIfPresent(Int.self, forKey: .marketingCampaignId)
        campaingName = try values.decodeIfPresent(String.self, forKey: .campaingName)
        marketingCampaignGUID = try values.decodeIfPresent(String.self, forKey: .marketingCampaignGUID)
        senderNetworkid = try values.decodeIfPresent(String.self, forKey: .senderNetworkid)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        createdBy = try values.decodeIfPresent(Int.self, forKey: .createdBy)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        createdDateTimeStr = try values.decodeIfPresent(String.self, forKey: .createdDateTimeStr)
        modifyedBy = try values.decodeIfPresent(Int.self, forKey: .modifyedBy)
        modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
    }
}

class SendMessageChatListViewModel{
    
    let objHandler = SendMessageChatListHandler()
    
    func callGetSendMessageChatList(UserId:Int,Type:Int,Token:String,MarketingCampaignGUID:String,AdminID:Int ,handler: @escaping ((SendMessageChatListModel?, Error?) -> ())) {
        
        objHandler.GetHandler(UserId: UserId, Type: Type, Token: Token, MarketingCampaignGUID: MarketingCampaignGUID, AdminId: AdminID) { (SendMessageChatListModel, Error) in
            guard let model = SendMessageChatListModel else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}
