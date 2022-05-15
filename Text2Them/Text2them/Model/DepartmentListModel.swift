//
//  DepartmentListModel.swift
//  Text2them
//
//  Created by mac on 11/05/21.
//

import Foundation

struct DepartmentListModel : Codable{
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataDepartment?

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
        data = try values.decodeIfPresent(DataDepartment.self, forKey: .data)
    }

}

struct DataDepartment : Codable {
    let departmentList : [DepartmentList]?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case departmentList = "departmentList"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        departmentList = try values.decodeIfPresent([DepartmentList].self, forKey: .departmentList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct DepartmentList : Codable {
    let name : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case name = "Name"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}





class DepartmentListViewModel {
    
    let Placholders: placholders = placholders()
    let objDepartmentListHandler = DepartmentListHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callDepartmentListAPI(UserID: Int, Type: Int, Token: String,handler: @escaping ((DepartmentListModel?, Error?) -> ())) {
        objDepartmentListHandler.GetHandler(UserID: UserID, Type: Type, Token: Token)  { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
    func callDepartmentDeleteAPI(UserID: Int, id: Int, Token: String,handler: @escaping ((DepartmentListModel?, Error?) -> ())) {
        objDepartmentListHandler.DeleteHandler(UserID: UserID, id: id, Token: Token) { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
    func callDepartmentAddAPI(UserID: Int, Name: String, Token: String,handler: @escaping ((DepartmentListModel?, Error?) -> ())) {
        objDepartmentListHandler.AddHandler(UserID: UserID, Name: Name, Token: Token) { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    func callDepartmentEditAPI(UserID: Int, Name: String, Token: String,id: Int,handler: @escaping ((DepartmentListModel?, Error?) -> ())) {
        
        objDepartmentListHandler.EditHandler(UserID: UserID, Name: Name, Token: Token, id: id) { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}





