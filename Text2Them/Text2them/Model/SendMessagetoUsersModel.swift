//
//  SendMessagetoUsersModel.swift
//  Text2them
//
//  Created by mac on 19/11/21.
//

import Foundation

struct SendMessagetoUsersModel : Codable {
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

class SendMessagetoUsersViewModel {
    
    let Placholders: placholders = placholders()
    let objSendMessagetoUsersHandler = SendMessagetoUsersHandler()
   
    struct placholders {
        let Email = "Email*"
        
    }
    
    func callSendMessagetoUsersAPI(AdminId:Int,MeesageTouserList:[[String:Any]],MessageText:String,Subject:String,Token:String,Type:Int,UserID:Int,handler: @escaping ((SendMessagetoUsersModel?, Error?) -> ())) {
     //   objForgotPassworHandler.GetHandler(UserEmail: EmailId) { (json, Error) in
  

          //  objStaffMemberListHandler.GetHandler(UserID: UserID, Token: Token) { (json, Error) in
       // objContactToUserDropDownListHandler.GetHandler(AdminId: AdminId, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { (json, Error) in
        
      //  objContactToUserGetUsersListHandler.GetHandler(AdminId: AdminId, ContactGroup: ContactGroup, Departmentid: Departmentid, Designationid: Designationid, Token: Token, Type: Type, UserID: UserID, UserType: UserType) { (json, Error) in
            
        objSendMessagetoUsersHandler.GetHandler(AdminId: AdminId, MeesageTouserList: MeesageTouserList, MessageText: MessageText, Subject: Subject, Token: Token, Type: Type, UserID: UserID) {(json, Error) in
        
   
            guard let model = json else {
                
                handler(nil, Error)
                return
            }
            handler(model, Error)
        }
    }
    
}





