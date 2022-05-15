//
//  MessageChatListModel.swift
//  Text2them
//
//  Created by Pratik on 22/07/21.
//

import Foundation

struct MessageChatListModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataMessageChatList?
    
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
        data = try values.decodeIfPresent(DataMessageChatList?.self, forKey: .data)!
    }
}

struct DataMessageChatList  : Codable {
    let campaignId : Int?
    let communicationId : Int?
    let campaignGUID : String?
    let communicationGUID : String?
    let messageContent : String?
    let messageDate : String?
    let replyFrom : String?
    let message : String?
    let firstName : String?
    let lastName : String?
    let skipcount : Int?
    let takecount : Int?
    let pageIndex : Int?
    let pageSize : Int?
    let createdBy : Int?
    let chatList : [ChatList]?
    let userID : Int?
    let type : Int?
    let adminId : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case campaignId = "CampaignId"
        case communicationId = "CommunicationId"
        case campaignGUID = "CampaignGUID"
        case communicationGUID = "CommunicationGUID"
        case messageContent = "MessageContent"
        case messageDate = "MessageDate"
        case replyFrom = "ReplyFrom"
        case message = "Message"
        case firstName = "FirstName"
        case lastName = "LastName"
        case skipcount = "skipcount"
        case takecount = "takecount"
        case pageIndex = "pageIndex"
        case pageSize = "pageSize"
        case createdBy = "CreatedBy"
        case chatList = "chatList"
        case userID = "UserID"
        case type = "Type"
        case adminId = "AdminId"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        campaignId = try values.decodeIfPresent(Int.self, forKey: .campaignId)
        communicationId = try values.decodeIfPresent(Int.self, forKey: .communicationId)
        campaignGUID = try values.decodeIfPresent(String.self, forKey: .campaignGUID)
        communicationGUID = try values.decodeIfPresent(String.self, forKey: .communicationGUID)
        messageContent = try values.decodeIfPresent(String.self, forKey: .messageContent)
        messageDate = try values.decodeIfPresent(String.self, forKey: .messageDate)
        replyFrom = try values.decodeIfPresent(String.self, forKey: .replyFrom)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        skipcount = try values.decodeIfPresent(Int.self, forKey: .skipcount)
        takecount = try values.decodeIfPresent(Int.self, forKey: .takecount)
        pageIndex = try values.decodeIfPresent(Int.self, forKey: .pageIndex)
        pageSize = try values.decodeIfPresent(Int.self, forKey: .pageSize)
        createdBy = try values.decodeIfPresent(Int.self, forKey: .createdBy)
        chatList = try values.decodeIfPresent([ChatList].self, forKey: .chatList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
}

struct ChatList : Codable {
    let campaignId : Int?
    let communicationId : Int?
    let campaignGUID : String?
    let communicationGUID : String?
    let messageContent : String?
    let messageDate : String?
    let replyFrom : String?
    let message : String?
    let firstName : String?
    let lastName : String?
    let skipcount : Int?
    let takecount : Int?
    let pageIndex : Int?
    let pageSize : Int?
    let createdBy : Int?
    let chatList : String?
    let userID : Int?
    let type : Int?
    let adminId : Int?
    let token : String?
    var sender : Bool?

    enum CodingKeys: String, CodingKey {

        case campaignId = "CampaignId"
        case communicationId = "CommunicationId"
        case campaignGUID = "CampaignGUID"
        case communicationGUID = "CommunicationGUID"
        case messageContent = "MessageContent"
        case messageDate = "MessageDate"
        case replyFrom = "ReplyFrom"
        case message = "Message"
        case firstName = "FirstName"
        case lastName = "LastName"
        case skipcount = "skipcount"
        case takecount = "takecount"
        case pageIndex = "pageIndex"
        case pageSize = "pageSize"
        case createdBy = "CreatedBy"
        case chatList = "chatList"
        case userID = "UserID"
        case type = "Type"
        case adminId = "AdminId"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        campaignId = try values.decodeIfPresent(Int.self, forKey: .campaignId)
        communicationId = try values.decodeIfPresent(Int.self, forKey: .communicationId)
        campaignGUID = try values.decodeIfPresent(String.self, forKey: .campaignGUID)
        communicationGUID = try values.decodeIfPresent(String.self, forKey: .communicationGUID)
        messageContent = try values.decodeIfPresent(String.self, forKey: .messageContent)
        messageDate = try values.decodeIfPresent(String.self, forKey: .messageDate)
        replyFrom = try values.decodeIfPresent(String.self, forKey: .replyFrom)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        skipcount = try values.decodeIfPresent(Int.self, forKey: .skipcount)
        takecount = try values.decodeIfPresent(Int.self, forKey: .takecount)
        pageIndex = try values.decodeIfPresent(Int.self, forKey: .pageIndex)
        pageSize = try values.decodeIfPresent(Int.self, forKey: .pageSize)
        createdBy = try values.decodeIfPresent(Int.self, forKey: .createdBy)
        chatList = try values.decodeIfPresent(String.self, forKey: .chatList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        sender = false
    }

}

class MessageChatListViewModel{
    
    let objHandler = MessageChatListingHandler()
    
    func callGetContactMessageList(UserId: Int, Type: Int,Token: String ,CommunicationGUID:String,handler: @escaping ((MessageChatListModel?, Error?) -> ())) {
        objHandler.GetHandler(UserId: UserId, Type: Type, Token: Token, CommunicationGUID: CommunicationGUID) { (MessageChatListModel, Error) in
            guard let model = MessageChatListModel else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}
