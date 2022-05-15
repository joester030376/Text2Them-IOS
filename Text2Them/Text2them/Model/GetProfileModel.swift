//
//  GetProfileModel.swift
//  Text2Them
//
//  Created by mac on 29/04/21.
//

import Foundation

struct GetProfileModel : Codable {
    let message : String?
    let strStatus : String?
    let status : Bool?
    let data : DataProfile?

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
        data = try values.decodeIfPresent(DataProfile.self, forKey: .data)
    }
}


struct DataProfile : Codable {
    let name : String?
    let lastName : String?
    let iD : Int?
    let organizationId : Int?
    let email : String?
    let password : String?
    let organizationName : String?
    let description : String?
    let datapurge : String?
    let website : String?
    let country : Int?
    let state : Int?
    let city : String?
    let zipCode : String?
    let cityList : String?
    let countryList : String?
    let stateList : String?
    let msg : String?
    let profileImage : String?
    let countryName : String?
    let stateName : String?
    let userID : Int?
    let type : Int?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case name = "Name"
        case lastName = "LastName"
        case iD = "ID"
        case organizationId = "OrganizationId"
        case email = "Email"
        case password = "Password"
        case organizationName = "OrganizationName"
        case description = "Description"
        case datapurge = "Datapurge"
        case website = "website"
        case country = "Country"
        case state = "state"
        case city = "city"
        case zipCode = "ZipCode"
        case cityList = "cityList"
        case countryList = "countryList"
        case stateList = "stateList"
        case msg = "msg"
        case profileImage = "ProfileImage"
        case countryName = "CountryName"
        case stateName = "StateName"
        case userID = "UserID"
        case type = "Type"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        organizationId = try values.decodeIfPresent(Int.self, forKey: .organizationId)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        organizationName = try values.decodeIfPresent(String.self, forKey: .organizationName)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        datapurge = try values.decodeIfPresent(String.self, forKey: .datapurge)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        country = try values.decodeIfPresent(Int.self, forKey: .country)
        state = try values.decodeIfPresent(Int.self, forKey: .state)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipCode = try values.decodeIfPresent(String.self, forKey: .zipCode)
        cityList = try values.decodeIfPresent(String.self, forKey: .cityList)
        countryList = try values.decodeIfPresent(String.self, forKey: .countryList)
        stateList = try values.decodeIfPresent(String.self, forKey: .stateList)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
        stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}



class GetProfileViewModel {
    
    let Placholders: placholders = placholders()
    let objProfileHandler = GetProfileHandler()
    
    struct placholders {
        let Email = "Email"
        let Password = "Password"
    }
    
    func callGetProfileAPI(UserID: Int, Token: String,handler: @escaping ((GetProfileModel?, Error?) -> ())) {
      
    //    objLoginHandler.GetHandler(UserEmail: Email, Password: Password) { (loginModel, Error) in
        objProfileHandler.GetHandler(UserID: UserID, Token: Token) { (GetProfileModel, Error) in
       
      //  GetHandler(UserName: UserName, Password: Password){ (loginModel, Error) in
      
                  guard let model = GetProfileModel else {
      
                      handler(nil, Error)
                      return
                  }
                  handler(model, Error)
              }
          }
    }

