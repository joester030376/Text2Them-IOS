//
//  DepartmentDeleteModel.swift
//  Text2them
//
//  Created by Admin on 14/05/21.
//

import Foundation
struct DepartmentDeleteModel : Codable{
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

    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        strStatus = try values.decodeIfPresent(String.self, forKey: .strStatus)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(String.self, forKey: .data)
    }
}

class DepartmentDeleteViewModel
{
    let objDepartmentDeleteHandler = DepartmentDeleteHandler()
    func callDepartmentDeleteAPI(id: Int,UserID: Int,Token: String,handler: @escaping ((StaffMemberViewModel?, Error?) -> ()))
    {
        objDepartmentDeleteHandler.DeleteHandler(id: id, UserID: UserID, Token: Token){ (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}
