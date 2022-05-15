//
//  DesignationListModel.swift
//  Text2them
//
//  Created by mac on 11/05/21.
//

import Foundation

struct DesignationListModel: Codable{
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataDesignation?

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
        data = try values.decodeIfPresent(DataDesignation.self, forKey: .data)
    }

}


struct DataDesignation : Codable {
    let designationList : [DesignationList]?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case designationList = "designationList"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        designationList = try values.decodeIfPresent([DesignationList].self, forKey: .designationList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct DesignationList : Codable {
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


class DesignationListViewModel {
    
    let Placholders: placholders = placholders()
    let objDesignationListHandler = DesignationListHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callDesignationListAPI(UserID: Int, Type: Int, Token: String,handler: @escaping ((DesignationListModel?, Error?) -> ())) {

        objDesignationListHandler.GetHandler(UserID: UserID, Type: Type, Token: Token)  { (json, Error) in
      
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
    func callDesignationDeleteAPI(UserID: Int, id: Int, Token: String,handler: @escaping ((DesignationListModel?, Error?) -> ())) {
        objDesignationListHandler.DeleteHandler(UserID: UserID, id: id, Token: Token) { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
    func callDesignationAddAPI(UserID: Int, Name: String, Token: String,handler: @escaping ((DesignationListModel?, Error?) -> ())) {
        objDesignationListHandler.AddHandler(UserID: UserID, Name: Name, Token: Token) { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    func callDesignationEditAPI(UserID: Int, Name: String, Token: String,id: Int,handler: @escaping ((DesignationListModel?, Error?) -> ())) {
        
        objDesignationListHandler.EditHandler(UserID: UserID, Name: Name, Token: Token, id: id) { (json, Error) in
            guard let model = json else {
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }

    
}





