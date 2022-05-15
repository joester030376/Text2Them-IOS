//
//  StaffMemberSaveModel.swift
//  Text2them
//
//  Created by mac on 14/05/21.
//

import Foundation

struct StaffMemberSaveModel : Codable{
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


class StaffMemberSaveViewModel {
    
    let Placholders: placholders = placholders()
    let objStaffMemberSaveHandler = StaffMemberSaveHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callStaffMemberSaveAPI(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool, IP:String,CityName:String,UserID:Int,Type:Int,Token:String,handler: @escaping
        ((StaffMemberSaveModel?, Error?) -> ())) {
  
        objStaffMemberSaveHandler.GetHandler (FirstName:FirstName,LastName:LastName,Department:Department,Designation:Designation,Mobilenumber:Mobilenumber,Email:Email,WorkTimings:WorkTimings,Country:Country,State:State,ZipCode:ZipCode,IsUser:IsUser,IP:IP,CityName:CityName,UserID:UserID,Type:Type,Token:Token)
        { (json, Error) in
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}









