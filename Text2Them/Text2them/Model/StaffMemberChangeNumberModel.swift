//
//  StaffMemberChangeNumberModel.swift
//  Text2them
//
//  Created by Pratik on 02/07/21.
//

import Foundation

struct StaffMemberChangeNumberModel : Codable{
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


class StaffMemberChangeNumberViewModel{
    
    let Placholders: placholders = placholders()
    let objChnngeNumber = StaffChangeNumberHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callStaffMemberDeleteAPI(UserID: Int,StaffmemberId: Int, Mobilenumber:String, Token:String,handler: @escaping ((DepartmentDeleteModel?, Error?) -> ())) {
     
        objChnngeNumber.GetHandler(UserID: UserID, StaffmemberId: StaffmemberId, Mobilenumber: Mobilenumber, Token: Token){ (json, Error) in
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}
