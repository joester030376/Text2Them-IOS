//
//  ContactToUserGetUsersListModel.swift
//  Text2them
//
//  Created by mac on 18/11/21.
//

import Foundation

struct ContactToUserGetUsersListModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : [DataUserList]?

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
        data = try values.decodeIfPresent([DataUserList].self, forKey: .data)
    }

}

struct DataUserList : Codable {
    let companyName : String?
    let name : String?
    let phonenumber : String?
    let userId : Int?
    let networkEmailID : String?
    let designation : String?
    let department : String?
    let userType : String?
    let contactGroup : String?
    let designationid : Int?
    let departmentid : Int?
    let userTypeid : Int?
    let contactGroupid : Int?

    enum CodingKeys: String, CodingKey {

        case companyName = "CompanyName"
        case name = "Name"
        case phonenumber = "phonenumber"
        case userId = "UserId"
        case networkEmailID = "NetworkEmailID"
        case designation = "Designation"
        case department = "Department"
        case userType = "UserType"
        case contactGroup = "ContactGroup"
        case designationid = "Designationid"
        case departmentid = "Departmentid"
        case userTypeid = "UserTypeid"
        case contactGroupid = "ContactGroupid"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phonenumber = try values.decodeIfPresent(String.self, forKey: .phonenumber)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        networkEmailID = try values.decodeIfPresent(String.self, forKey: .networkEmailID)
        designation = try values.decodeIfPresent(String.self, forKey: .designation)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        userType = try values.decodeIfPresent(String.self, forKey: .userType)
        contactGroup = try values.decodeIfPresent(String.self, forKey: .contactGroup)
        designationid = try values.decodeIfPresent(Int.self, forKey: .designationid)
        departmentid = try values.decodeIfPresent(Int.self, forKey: .departmentid)
        userTypeid = try values.decodeIfPresent(Int.self, forKey: .userTypeid)
        contactGroupid = try values.decodeIfPresent(Int.self, forKey: .contactGroupid)
    }

}


class ContactToUserGetUsersListViewModel {
    
    let Placholders: placholders = placholders()
    let objContactToUserGetUsersListHandler = ContactToUserGetUsersListHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callContactToUserGetUsersListAPI(AdminId:Int,ContactGroup:Int,Departmentid:Int,Designationid:Int,Token:String,Type:Int,UserID:Int,UserType:Int,handler: @escaping ((ContactToUserGetUsersListModel?, Error?) -> ())) {
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  

          //  objStaffMemberListHandler.GetHandler(UserID: UserID, Token: Token) { (json, Error) in
       // objContactToUserDropDownListHandler.GetHandler(AdminId: AdminId, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { (json, Error) in
        
        objContactToUserGetUsersListHandler.GetHandler(AdminId: AdminId, ContactGroup: ContactGroup, Departmentid: Departmentid, Designationid: Designationid, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { (json, Error) in
        
        
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





