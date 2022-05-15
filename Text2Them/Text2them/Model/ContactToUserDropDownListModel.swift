//
//  ContactToUserDropDownListModel.swift
//  Text2them
//
//  Created by mac on 18/11/21.
//

import Foundation

struct ContactToUserDropDownListModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataContact?

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
        data = try values.decodeIfPresent(DataContact.self, forKey: .data)
    }

}

struct DataContact : Codable {
    let messageModelList : String?
    let departmentList : [MessageDepartmentList]?
    let designationList : [MessageDesignationList]?
    let contactgrpList : [MessageDesignationList]?
    let designationid : Int?
    let departmentid : Int?
    let userType : Int?
    let contactGroup : Int?
    let userID : Int?
    let type : Int?
    let adminId : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case messageModelList = "messageModelList"
        case departmentList = "DepartmentList"
        case designationList = "DesignationList"
        case contactgrpList = "contactgrpList"
        case designationid = "Designationid"
        case departmentid = "Departmentid"
        case userType = "UserType"
        case contactGroup = "ContactGroup"
        case userID = "UserID"
        case type = "Type"
        case adminId = "AdminId"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        messageModelList = try values.decodeIfPresent(String.self, forKey: .messageModelList)
        departmentList = try values.decodeIfPresent([MessageDepartmentList].self, forKey: .departmentList)
        designationList = try values.decodeIfPresent([MessageDesignationList].self, forKey: .designationList)
        contactgrpList = try values.decodeIfPresent([MessageDesignationList].self, forKey: .contactgrpList)
        designationid = try values.decodeIfPresent(Int.self, forKey: .designationid)
        departmentid = try values.decodeIfPresent(Int.self, forKey: .departmentid)
        userType = try values.decodeIfPresent(Int.self, forKey: .userType)
        contactGroup = try values.decodeIfPresent(Int.self, forKey: .contactGroup)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}
//AdminId = 0;
//GroupName = "<null>";
//Name = Developer;
//Token = "<null>";
//Type = 0;
//UserID = 0;
//id = 29;
//msg = "<null>";

struct MessageDepartmentList : Codable {
    let id : Int?
    let name : String?
    let msg : String?
    let deptName : String?
    let userID : Int?
    let type : Int?
    let adminId : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "Name"
        case msg = "msg"
        case deptName = "DeptName"
        case userID = "UserID"
        case type = "Type"
        case adminId = "AdminId"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        deptName = try values.decodeIfPresent(String.self, forKey: .deptName)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        adminId = try values.decodeIfPresent(Int.self, forKey: .adminId)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct MessageDesignationList : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "Name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}


class ContactToUserDropDownListViewModel {
    
    let Placholders: placholders = placholders()
    let objContactToUserDropDownListHandler = ContactToUserDropDownListHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callContactToUserDropDownListAPI(AdminId:Int,Token:String,Type:Int,UserID:Int,UserType:Int,handler: @escaping ((ContactToUserDropDownListModel?, Error?) -> ())) {
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  

          //  objStaffMemberListHandler.GetHandler(UserID: UserID, Token: Token) { (json, Error) in
        objContactToUserDropDownListHandler.GetHandler(AdminId: AdminId, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { (json, Error) in
        
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





