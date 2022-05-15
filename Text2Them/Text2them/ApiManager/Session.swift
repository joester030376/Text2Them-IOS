//
//  Session.swift
//  DIOS Transportation
//
//  Created by mac on 19/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation


fileprivate enum SessionKey: String {
    
    case AdminId = "AdminId"
    case Id = "Id"
    case loggedUserID = "loggedUserID"
    case profileImage = "profileImage"
    case email = "email"
    case name = "Name"
    case number = "Number"
    case zip = "Zip"
    case OrganizationId = "OrganizationId"
    case OrganizationName = "OrganizationName"
    case Datapurge = "Datapurge"
    case website = "website"
    case Country = "Country"
    case state = "state"
    case statename = "StateName"
    case city = "city"
    case ZipCode = "ZipCode"
    case Description = "Description"
    case type = "Type"
    case brandInspecter = "brandInspecter"
    case licenceNo = "LicenceNo"
    case headquarterCity = "headquarterCity"
    case ProfilePic = "ProfilePic"
    case SignaturePic = "SignaturePic"
    case SessionKeyAPI = "SessionKey"
    case strWeeklyStartDate = "strWeeklyStartDate"
    case strWeeklyEndDate = "strWeeklyEndDate"
    case AddressLine1 = "AddressLine1"
    case AddressLine2 = "AddressLine2"
    case strSelectedAddTaskDate = "strSelectedAddTaskDate"
    case strExpenseIndex = "strExpenseIndex"
    case HeadCount1 = "HeadCount1"
    case PositionId = "PositionId"
    case UserTypes = "UserTypes"
    case token = "token"
    case userName = "userName"
    case error = "error"
    case message = "message"
    
    func set(_ value: String) {
        UserDefaults.standard.set(value, forKey: rawValue)
    }
    
    func set(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: rawValue)
    }
    
    func set(_ value: Int) {
        UserDefaults.standard.set(value, forKey: rawValue)
    }
    
    
    func string() -> String? {
        return UserDefaults.standard.string(forKey: rawValue)
    }
    
    func bool() -> Bool {
        return UserDefaults.standard.bool(forKey: rawValue)
    }
    
    func int() -> Int {
        return UserDefaults.standard.integer(forKey: rawValue)
    }
    
}

class Session: NSObject {
    
    //This prevents others from using the default '()' initializer for this class.
    private override init(){}
    
    static var id: String {
        
        get{
            let id = SessionKey.Id
            return id.string() ?? ""
        }
        
        set(value){
            let id = SessionKey.Id
            id.set(value)
        }
        
    }
  
    static var profileImage: String {
        
        get{
            let profileImage = SessionKey.profileImage
            return profileImage.string() ?? ""
        }
        
        set(value){
            let profileImage = SessionKey.profileImage
            profileImage.set(value)
        }
        
    }
    
    static var userName: String {
        
        get{
            let userName = SessionKey.userName
            return userName.string() ?? ""
        }
        
        set(value){
            let userName = SessionKey.userName
            userName.set(value)
        }
        
    }
    
    static var error: String {
        
        get{
            let error = SessionKey.error
            return error.string() ?? ""
        }
        
        set(value){
            let error = SessionKey.error
            error.set(value)
        }
        
    }
    
    
    static var token: String {
        
        get{
            let token = SessionKey.token
            return token.string() ?? ""
        }
        
        set(value){
            let token = SessionKey.token
            token.set(value)
        }
        
    }
    
    
    
    static var message: String {
        
        get{
            let message = SessionKey.message
            return message.string() ?? ""
        }
        
        set(value){
            let message = SessionKey.message
            message.set(value)
        }
        
    }
    
    
    static var email: String {
        
        get{
            let email = SessionKey.email
            return email.string() ?? ""
        }
        
        set(value){
            let email = SessionKey.email
            email.set(value)
        }
        
    }
    
    static var loggedUserID: String {
        
        get{
            let loggedUserID = SessionKey.loggedUserID
            return loggedUserID.string() ?? ""
        }
        
        set(value){
            let loggedUserID = SessionKey.loggedUserID
            loggedUserID.set(value)
        }
        
    }
    
    static var name: String {
        
        get{
            let name = SessionKey.name
            return name.string() ?? ""
        }
        
        set(value){
            let name = SessionKey.name
            name.set(value)
        }
        
    }
    
    static var number: String {
        
        get{
            let number = SessionKey.number
            return number.string() ?? ""
        }
        
        set(value){
            let number = SessionKey.number
            number.set(value)
        }
        
    }
    
    static var city: String {
        
        get{
            let city = SessionKey.city
            return city.string() ?? ""
        }
        
        set(value){
            let city = SessionKey.city
            city.set(value)
        }
        
    }
    
    static var OrganizationId: String {
        get{
            let OrganizationId = SessionKey.OrganizationId
            return OrganizationId.string() ?? ""
        }
        set(value){
            let OrganizationId = SessionKey.OrganizationId
            OrganizationId.set(value)
        }
    }
    
    static var OrganizationName: String {
        get
        {
            let OrganizationName = SessionKey.OrganizationName
            return OrganizationName.string() ?? ""
        }
        
        set(value)
        {
            let OrganizationName = SessionKey.OrganizationName
            OrganizationName.set(value)
        }
    }
    
    
    static var Description: String {
        
        get{
            let Description = SessionKey.Description
            return Description.string() ?? ""
        }
        
        set(value){
            let Description = SessionKey.Description
            Description.set(value)
        }
    }
    
    static var type: String {
        
        get{
            let type = SessionKey.type
            return type.string() ?? ""
        }
        
        set(value){
            let type = SessionKey.type
            type.set(value)
        }
    }
    
    static var AdminId: String {
        
        get{
            let AdminId = SessionKey.AdminId
            return AdminId.string() ?? ""
        }
        
        set(value){
            let AdminId = SessionKey.AdminId
            AdminId.set(value)
        }
        
    }
    
    static var Datapurge: String {
        
        get{
            let Datapurge = SessionKey.Datapurge
            return Datapurge.string() ?? ""
        }
        
        set(value){
            let Datapurge = SessionKey.Datapurge
            Datapurge.set(value)
        }
    }
    
    static var website: String {
        
        get{
            let website = SessionKey.website
            return website.string() ?? ""
        }
        
        set(value){
            let website = SessionKey.website
            website.set(value)
        }
    }
    
    static var Country: String {
        
        get{
            let Country = SessionKey.Country
            return Country.string() ?? ""
        }
        
        set(value){
            let Country = SessionKey.Country
            Country.set(value)
        }
    }
    
    static var state: String {
        get{
            let state = SessionKey.state
            return state.string() ?? ""
        }
        
        set(value){
            let state = SessionKey.state
            state.set(value)
        }
    }
    
    static var statename: String {
        get{
            let state = SessionKey.statename
            return state.string() ?? ""
        }
        
        set(value){
            let state = SessionKey.statename
            state.set(value)
        }
    }
    
    static var ZipCode: String {
        
        get{
            let ZipCode = SessionKey.ZipCode
            return ZipCode.string() ?? ""
        }
        
        set(value){
            let ZipCode = SessionKey.ZipCode
            ZipCode.set(value)
        }
    }
    
    
    
    static var zip: String {
        
        get{
            let zip = SessionKey.zip
            return zip.string() ?? ""
        }
        
        set(value){
            let zip = SessionKey.zip
            zip.set(value)
        }
        
    }
    
    static var brandInspecter: String {
        
        get{
            let brandInspecter = SessionKey.brandInspecter
            return brandInspecter.string() ?? ""
        }
        
        set(value){
            let brandInspecter = SessionKey.brandInspecter
            brandInspecter.set(value)
        }
        
    }
    
    static var licenceNo: String {
        
        get{
            let licenceNo = SessionKey.licenceNo
            return licenceNo.string() ?? ""
        }
        
        set(value){
            let licenceNo = SessionKey.licenceNo
            licenceNo.set(value)
        }
    }
    
    static var headquarterCity: String {
        
        get{
            let headquarterCity = SessionKey.headquarterCity
            return headquarterCity.string() ?? ""
        }
        
        set(value){
            let headquarterCity = SessionKey.headquarterCity
            headquarterCity.set(value)
        }
    }
    
    static var ProfilePic: String {
        
        get{
            let ProfilePic = SessionKey.ProfilePic
            return ProfilePic.string() ?? ""
        }
        
        set(value){
            let ProfilePic = SessionKey.ProfilePic
            ProfilePic.set(value)
        }
    }
    
    static var SignaturePic: String {
        
        get{
            let SignaturePic = SessionKey.SignaturePic
            return SignaturePic.string() ?? ""
        }
        
        set(value){
            let SignaturePic = SessionKey.SignaturePic
            SignaturePic.set(value)
        }
    }
    
    static var SessionKeyAPI: String {
        
        get{
            let SessionKeyAPI = SessionKey.SessionKeyAPI
            return SessionKeyAPI.string() ?? ""
        }
        
        set(value){
            let SessionKeyAPI = SessionKey.SessionKeyAPI
            SessionKeyAPI.set(value)
        }
    }
    
    static var strWeeklyStartDate: String {
        
        get{
            let strWeeklyStartDate = SessionKey.strWeeklyStartDate
            return strWeeklyStartDate.string() ?? ""
        }
        
        set(value){
            let strWeeklyStartDate = SessionKey.strWeeklyStartDate
            strWeeklyStartDate.set(value)
        }
    }
    
    static var strWeeklyEndDate: String {
        
        get{
            let strWeeklyEndDate = SessionKey.strWeeklyEndDate
            return strWeeklyEndDate.string() ?? ""
        }
        
        set(value){
            let strWeeklyEndDate = SessionKey.strWeeklyEndDate
            strWeeklyEndDate.set(value)
        }
    }
    
    static var AddressLine1: String {
        
        get{
            let AddressLine1 = SessionKey.AddressLine1
            return AddressLine1.string() ?? ""
        }
        
        set(value){
            let AddressLine1 = SessionKey.AddressLine1
            AddressLine1.set(value)
        }
    }
    
    static var AddressLine2: String {
        
        get{
            let AddressLine2 = SessionKey.AddressLine2
            return AddressLine2.string() ?? ""
        }
        
        set(value){
            let AddressLine2 = SessionKey.AddressLine2
            AddressLine2.set(value)
        }
    }
    
    static var strSelectedAddTaskDate: String {
        
        get{
            let strSelectedAddTaskDate = SessionKey.strSelectedAddTaskDate
            return strSelectedAddTaskDate.string() ?? ""
        }
        
        set(value){
            let strSelectedAddTaskDate = SessionKey.strSelectedAddTaskDate
            strSelectedAddTaskDate.set(value)
        }
    }
    
    static var strExpenseIndex: String {
        
        get{
            let strExpenseIndex = SessionKey.strExpenseIndex
            return strExpenseIndex.string() ?? ""
        }
        
        set(value){
            let strExpenseIndex = SessionKey.strExpenseIndex
            strExpenseIndex.set(value)
        }
    }
    
    static var HeadCount1: String {
        
        get{
            let HeadCount1 = SessionKey.HeadCount1
            return HeadCount1.string() ?? ""
        }
        
        set(value){
            let HeadCount1 = SessionKey.HeadCount1
            HeadCount1.set(value)
        }
    }
    
    static var PositionId: String {
        
        get{
            let PositionId = SessionKey.PositionId
            return PositionId.string() ?? ""
        }
        
        set(value){
            let PositionId = SessionKey.PositionId
            PositionId.set(value)
        }
    }
    
    static var UserTypes: String {
        
        get{
            let UserTypes = SessionKey.UserTypes
            return UserTypes.string() ?? ""
        }
        
        set(value){
            let UserTypes = SessionKey.UserTypes
            UserTypes.set(value)
        }
    }
}
