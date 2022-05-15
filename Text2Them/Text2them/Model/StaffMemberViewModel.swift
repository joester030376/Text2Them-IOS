//
//  StaffMemberViewModel.swift
//  Text2them
//
//  Created by mac on 07/05/21.
//

import Foundation

struct StaffMemberViewModel : Codable{
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataViewMember?

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
        data = try values.decodeIfPresent(DataViewMember.self, forKey: .data)
    }

}

struct DataViewMember : Codable {
    let firstName : String?
    let ip : String?
    let department : String?
    let designation : String?
    let mobilenumber : String?
    let email : String?
    let workTimings : String?
    let country : String?
    let state : String?
    let city : String?
    let zipCode : String?
    let msg : String?
    let isUser : Bool?
    let password : String?
    let id : Int?
    let lAstname : String?
    let cityName : String?
    let isactive : Bool?
    let departmentid : Int?
    let designationid : Int?
    let stateid : Int?
    let countryid : Int?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case firstName = "FirstName"
        case ip = "ip"
        case department = "Department"
        case designation = "Designation"
        case mobilenumber = "Mobilenumber"
        case email = "Email"
        case workTimings = "WorkTimings"
        case country = "Country"
        case state = "State"
        case city = "City"
        case zipCode = "ZipCode"
        case msg = "msg"
        case isUser = "IsUser"
        case password = "Password"
        case id = "id"
        case lAstname = "LAstname"
        case cityName = "CityName"
        case isactive = "Isactive"
        case departmentid = "Departmentid"
        case designationid = "Designationid"
        case stateid = "Stateid"
        case countryid = "Countryid"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        designation = try values.decodeIfPresent(String.self, forKey: .designation)
        mobilenumber = try values.decodeIfPresent(String.self, forKey: .mobilenumber)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        workTimings = try values.decodeIfPresent(String.self, forKey: .workTimings)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipCode = try values.decodeIfPresent(String.self, forKey: .zipCode)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        isUser = try values.decodeIfPresent(Bool.self, forKey: .isUser)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lAstname = try values.decodeIfPresent(String.self, forKey: .lAstname)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
        isactive = try values.decodeIfPresent(Bool.self, forKey: .isactive)
        departmentid = try values.decodeIfPresent(Int.self, forKey: .departmentid)
        designationid = try values.decodeIfPresent(Int.self, forKey: .designationid)
        stateid = try values.decodeIfPresent(Int.self, forKey: .stateid)
        countryid = try values.decodeIfPresent(Int.self, forKey: .countryid)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}



class StaffMemberViewViewModel {
    
    let Placholders: placholders = placholders()
    let objStaffMemberViewHandler = StaffMemberViewHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callStaffMemberViewAPI(id: Int,handler: @escaping ((StaffMemberViewModel?, Error?) -> ())) {
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  

        objStaffMemberViewHandler.GetHandler(id: id)  { (json, Error) in
            
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





