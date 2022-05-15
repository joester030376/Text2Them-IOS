//
//  ReplayNewMessageModel.swift
//  Text2them
//
//  Created by Pratik on 02/08/21.
//

import Foundation
//
//  SendMessageMenuModel.swift
//  Text2them
//
//  Created by Pratik on 12/07/21.
//

import Foundation

struct ReplayNewMessageModel : Codable{
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


class ReplayNewMessageViewModel {
   
    let objHendler = ReplayNewMessageHandler()
   
    func callSendSmsFromMenuAPI(CampaignId: Int, CampaignGUID: String, CommunicationGUID: String, ReplyFrom: String, Message: String, UserID: Int, Type: Int, Token: String, AdminId: String,handler: @escaping((ReplayNewMessageModel?, Error?) -> ())) {
       
        objHendler.GetHandler(CampaignId: CampaignId, CampaignGUID: CampaignGUID, CommunicationGUID: CommunicationGUID, ReplyFrom: ReplyFrom, Message: Message, UserID: UserID, Type: Type, Token: Token, AdminId: AdminId) { (ReplayNewMessageModel, Error) in
            guard let model = ReplayNewMessageModel else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}
