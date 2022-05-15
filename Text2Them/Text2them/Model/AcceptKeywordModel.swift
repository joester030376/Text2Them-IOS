//
//  AcceptKeywordModel.swift
//  Text2them
//
//  Created by mac on 25/11/21.
//

import Foundation

struct AcceptKeywordModel : Codable{
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


class AcceptKeywordViewModel {
    
    let objAcceptKeywordHandler = AcceptKeywordHandler()
    
    func callAcceptKeywordAPI(UserID:Int,Type:Int,AdminId:Int,Token:String,CampaignGUID:String,ReplyFrom:String,handler: @escaping((AcceptKeywordModel?, Error?) -> ())) {
        
        objAcceptKeywordHandler.GetHandler(UserId: UserID, Type: Type, AdminId: AdminId, Token: Token, CampaignGUID: CampaignGUID, ReplyFrom: ReplyFrom) {(json, Error) in
          
            guard let model = json else{
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}



