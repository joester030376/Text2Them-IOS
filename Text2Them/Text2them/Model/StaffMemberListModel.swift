//
//  StaffMemberListModel.swift
//  Text2them
//
//  Created by mac on 03/05/21.
//

import Foundation

struct StaffMemberListModel : Codable{

    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataMember?
    
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
        data = try values.decodeIfPresent(DataMember.self, forKey: .data)
    }

}

struct DataMember : Codable {
    let staffmemberList : [StaffmemberList]?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case staffmemberList = "staffmemberList"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        staffmemberList = try values.decodeIfPresent([StaffmemberList].self, forKey: .staffmemberList)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct StaffmemberList : Codable {
    let name : String?
    let departmentName : String?
    let designationName : String?
    let phoneNumber : String?
    let id : Int?
    let isActive : Bool?
    let email : String?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case name = "Name"
        case departmentName = "DepartmentName"
        case designationName = "DesignationName"
        case phoneNumber = "PhoneNumber"
        case id = "id"
        case isActive = "IsActive"
        case email = "Email"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        departmentName = try values.decodeIfPresent(String.self, forKey: .departmentName)
        designationName = try values.decodeIfPresent(String.self, forKey: .designationName)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}



class StaffMemberListViewModel {
    
    let Placholders: placholders = placholders()
    let objStaffMemberListHandler = StaffMemberListHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callStaffMemberListAPI(UserID: Int, Token: String,handler: @escaping ((StaffMemberListModel?, Error?) -> ())) {
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  

            objStaffMemberListHandler.GetHandler(UserID: UserID, Token: Token) { (json, Error) in
     
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





