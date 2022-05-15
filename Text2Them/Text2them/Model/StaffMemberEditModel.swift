//
//  StaffMemberEditModel.swift
//  Text2them
//
//  Created by mac on 13/05/21.
//

import Foundation

struct StaffMemberEditModel : Codable{
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

class StaffMemberEditViewModel {
    
    let Placholders: placholders = placholders()
    let objStaffMemberEditHandler = StaffMemberEditHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callStaffMemberEditAPI(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool, IP:String,Id:Int,CityName:String,UserID:Int,Type:Int,Token:String,handler: @escaping
        ((StaffMemberEditModel?, Error?) -> ())) {
   
        objStaffMemberEditHandler.GetHandler (FirstName:FirstName,LastName:LastName,Department:Department,Designation:Designation,Mobilenumber:Mobilenumber,Email:Email,WorkTimings:WorkTimings,Country:Country,State:State,ZipCode:ZipCode,IsUser:IsUser,IP:IP,Id:Id,CityName:CityName,UserID:UserID,Type:Type,Token:Token)
        { (json, Error) in
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
}







