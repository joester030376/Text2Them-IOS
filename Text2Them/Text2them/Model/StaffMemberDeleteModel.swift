//
//  StaffMemberDeleteModel.swift
//  Text2them
//
//  Created by mac on 07/05/21.
//

import Foundation

struct StaffMemberDeleteModel : Codable{
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


class StaffMemberDeleteViewModel {
    
    let Placholders: placholders = placholders()
    let objStaffMemberDeleteHandler = StaffMemberDeleteHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callStaffMemberDeleteAPI(UserID: Int,id: Int,handler: @escaping ((StaffMemberViewModel?, Error?) -> ())) {

        objStaffMemberDeleteHandler.GetHandler(UserID: UserID, id: id)  { (json, Error) in
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





