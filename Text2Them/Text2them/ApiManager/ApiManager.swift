//
//  ApiManager.swift
//  WCGTX
//
//  Created by Admin on 08/02/21.
//

import Foundation
import UIKit
import Alamofire


typealias SOAPICompletionHandler = (_ code:Int, _ error:NSError?, _ response:Data?) -> Void

enum EncodingType {
    case Json
    
    case URL
}

class APIManager: NSObject {
    
    
    struct Constants {
        static let BASEURL = myURLs.baseURL
    }
    
    static var sharedInstance: APIManager = APIManager()
    
    class func callApi(_ strApiName:String,
                       param : [String : Any],
                       method: Alamofire.HTTPMethod,
                       header: HTTPHeaders?,
                       encodeType:ParameterEncoding?,
                       isLoader:Bool,
                       completionHandler:@escaping SOAPICompletionHandler) {
        
        if isLoader == true {
            // For Activity Indicator
            // Miscellaneous.APPDELEGATE.window!.makeMyToastActivity()
        }
        
        let header : HTTPHeaders = [
            // "Authorization": "Bearer \(Session.token)",
        ]
        
        if Reachabilitys.isConnectedToNetwork(){
            
            print("Api Name \(strApiName)")
            print("parameters \(param)")
            
            let manager = Alamofire.Session.default
            manager.session.configuration.timeoutIntervalForRequest = 120
            
            
            manager.request(strApiName, method: method, parameters: param, encoding: encodeType as! ParameterEncoding, headers: header ).responseJSON { response in
                debugPrint(response)
                print("response \(response)")
                if isLoader == true {
                    //        Miscellaneous.APPDELEGATE.window!.stopMyToastActivity()
                }
                if response.response?.statusCode == 200{
                    //    if response.result.isSuccess {
                    let jsonObject = response.data
                    // print("jsonObject \(jsonObject)")
                    
                    completionHandler(1, nil, jsonObject)
                } else {
                    print("error")
                    if isLoader == true {
                        //Miscellaneous.APPDELEGATE.window!.stopMyToastActivity()
                    }
                }
            }
        }else{
            //Miscellaneous.APPDELEGATE.window!.stopMyToastActivity()
            //Miscellaneous.APPDELEGATE.window!.showAlertFor(alertTitle: myMessages.ERROR, alertMessage: myMessages.INTERNET_CONNECTIVITY_FAIL)
        }
    }   
    
}

enum Response : Int{
    
    case success = 200
    case failure = 400
}
enum API {
    
    case login
    case forgotPasswordSentMail
    case ResetPassword
    case GetProfile
    case GetCountry
    case GetState
    case EditProfileDetail
    case EditOrganization
    case StaffMemberList
    case View
    case Delete
    case DepartmentList
    case AddDepartment
    case EditDepartment
    case DeleteDepartment
    case DesignationList
    case Edit
    case StaffMemberSave
    case DesignationAdd
    case DesignationEdit
    case DesignationDelete
    case notification
    case registration
    case token
    case forgotPassword
    case verifyOTP
    case resetPassword
    case dashboard
    case userInfo
    case employeelocations
    case list
    case employeeDocumentList
    case employeeScheduleList
    case clockIn
    case clockOut
    case DepartmentAdd
    case DepartmentEdit
    case DepartmentDelete
    case SubscriptionDetail
    case StaffChangeNumber
    case SendMessageFromMenu
    case ContactMessageList
    case MessageChatList
    case SendMessageChatList
    case ReplyNewMessage
    case ContactToUserDropDownList
    case getContactToUserGetUsersList
    case SendMessagetoUsers
    case ReceiveKeywordList
    case AcceptKeyword
    
    
    func requestString() -> String {
        
        switch self
        {
        case .login:
            return APIManager.Constants.BASEURL + ApiNames.login
            
        case .forgotPasswordSentMail:
            return APIManager.Constants.BASEURL + ApiNames.ForgotPasswordSendMail
            
        case .ResetPassword:
            return APIManager.Constants.BASEURL + ApiNames.resetPassword
            
        case .GetProfile:
            return APIManager.Constants.BASEURL + ApiNames.GetProfile
            
        case .GetCountry:
            return APIManager.Constants.BASEURL + ApiNames.GetCountry
            
        case .GetState:
            return APIManager.Constants.BASEURL + ApiNames.GetState
            
        case .EditProfileDetail:
            return APIManager.Constants.BASEURL + ApiNames.EditProfileDetail
            
        case .EditOrganization:
            return APIManager.Constants.BASEURL + ApiNames.EditOrganization
            
        case .StaffMemberList:
            return APIManager.Constants.BASEURL + ApiNames.StaffMemberList
            
        case .View:
            return APIManager.Constants.BASEURL + ApiNames.View
            
        case .Delete:
            return APIManager.Constants.BASEURL + ApiNames.Delete
            
        case .DepartmentList:
            return APIManager.Constants.BASEURL + ApiNames.DepartmentList
            
        case .DepartmentAdd:
            return APIManager.Constants.BASEURL + ApiNames.DepartmentAdd
            
        case .DepartmentEdit:
            return APIManager.Constants.BASEURL + ApiNames.DepartmentEdit
            
        case .DepartmentDelete:
            return APIManager.Constants.BASEURL + ApiNames.DepartmentDelete
            
        case .DesignationAdd:
            return APIManager.Constants.BASEURL + ApiNames.DesignationAdd
            
        case .DesignationEdit:
            return APIManager.Constants.BASEURL + ApiNames.DesignationEdit
            
        case .DesignationDelete:
            return APIManager.Constants.BASEURL + ApiNames.DesignationDelete
            
            
            
        case .AddDepartment:
            return APIManager.Constants.BASEURL + ApiNames.AddDepartment
            
        case .EditDepartment:
            return APIManager.Constants.BASEURL + ApiNames.EditDepartment
            
        case .DeleteDepartment:
            return APIManager.Constants.BASEURL + ApiNames.DeleteDepartment
            
        case .DesignationList:
            return APIManager.Constants.BASEURL + ApiNames.DesignationList
            
        case .Edit:
            return APIManager.Constants.BASEURL + ApiNames.Edit
            
        case .StaffMemberSave:
            return APIManager.Constants.BASEURL + ApiNames.StaffMemberSave
            
        case .notification:
            return APIManager.Constants.BASEURL + ApiNames.Vnotification
            
        case .registration:
            return APIManager.Constants.BASEURL + ApiNames.Vregistration
            
        case .token:
            return APIManager.Constants.BASEURL + ApiNames.Vtoken
            
        case .forgotPassword:
            return APIManager.Constants.BASEURL + ApiNames.VforgotPassword
            
            
        case .verifyOTP:
            return APIManager.Constants.BASEURL + ApiNames.VverifyOTP
            
        case .resetPassword:
            return APIManager.Constants.BASEURL + ApiNames.VresetPassword
            
        case .dashboard:
            return APIManager.Constants.BASEURL + ApiNames.dashboard
            
        case .userInfo:
            return APIManager.Constants.BASEURL + ApiNames.userInfo
            
        case .employeelocations:
            return APIManager.Constants.BASEURL + ApiNames.employeelocations
            
        case .list:
            return APIManager.Constants.BASEURL + ApiNames.list
            
        case .employeeDocumentList:
            return APIManager.Constants.BASEURL + ApiNames.employeeDocumentList
            
        case .employeeScheduleList:
            return APIManager.Constants.BASEURL + ApiNames.employeeScheduleList
            
        case .clockIn:
            return APIManager.Constants.BASEURL + ApiNames.clockIn
            
        case .clockOut:
            return APIManager.Constants.BASEURL + ApiNames.clockOut
            
        case .SubscriptionDetail:
            return APIManager.Constants.BASEURL + ApiNames.SubscriptionDetail
            
        case .StaffChangeNumber:
            return APIManager.Constants.BASEURL + ApiNames.StaffChangeNumber
            
        case .SendMessageFromMenu:
            return APIManager.Constants.BASEURL + ApiNames.SendMessageFromMenu
            
        case .ContactMessageList:
            return APIManager.Constants.BASEURL + ApiNames.ContactMessageList
            
        case .MessageChatList:
            return APIManager.Constants.BASEURL + ApiNames.MessageChatList
        
        case .SendMessageChatList:
            return APIManager.Constants.BASEURL + ApiNames.SendMessageChatList
            
        case .ReplyNewMessage:
            return APIManager.Constants.BASEURL + ApiNames.ReplyNewMessage
            
        case .ContactToUserDropDownList:
            return APIManager.Constants.BASEURL + ApiNames.ContactToUserDropDownList
        case .getContactToUserGetUsersList:
            return APIManager.Constants.BASEURL + ApiNames.ContactToUserGetUsersList
        case .SendMessagetoUsers:
            return APIManager.Constants.BASEURL + ApiNames.SendMessagetoUsers
        case .ReceiveKeywordList:
            return APIManager.Constants.BASEURL + ApiNames.ReceiveKeywordList
        case .AcceptKeyword:
            return APIManager.Constants.BASEURL + ApiNames.AcceptKeyword
        }
    }
}

enum APIParameter {
    
    //let PreferredLocations : [String]
    
    case login(Email:String,Password:String)
    case forgotPasswordSentMail(Email:String)
    case ResetPassword(OldPassword:String,NewPassword:String,ConfirmPassword:String,id:Int)
    case GetProfile(UserID:Int,Token:String)
    case GetCountry(Token:String)
    case GetState(Token:String)
    case EditProfileDetail(Name:String,LastName:String,Email:String,Password:String,UserID:Int,Type:Int,Token:String)
    case EditOrganization(OrganizationId:Int,OrganizationName:String,Description:String,Datapurge:String,website:String,Country:Int,state:Int,city:String,ZipCode:String,UserID:Int,Type:Int,Token:String)
    case StaffMemberList(UserID:Int,Token:String)
    case View(id:Int)
    case Delete(id:Int,UserID:Int)
    case DepartmentList(UserID:Int,Type:Int,Token:String)
    case AddDepartment(Name:String,UserID:Int,Token:String)
    case EditDepartment(Name:String,UserID:Int,Token:String,id:Int)
    case DeleteDepartment(id:Int,UserID:Int,Token:String)
    case DesignationList(UserID:Int,Type:Int,Token:String)
    case Edit(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool, IP:String,Id:Int,CityName:String,UserID:Int,Type:Int,Token:String)
    case StaffMemberSave(FirstName:String,LastName:String,Department:Int,Designation:Int,Mobilenumber:String,Email:String,WorkTimings:String,Country:Int,State:Int,ZipCode:String,IsUser:Bool, IP:String,CityName:String,UserID:Int,Type:Int,Token:String)
    case DepartmentAdd(Name:String,UserID:Int,Token:String)
    case DepartmentEdit(Id:Int,Name:String,UserID:Int,Token:String)
    case DepartmentDelete(Id:Int,UserID:Int,Token:String)
    case DesignationAdd(Name:String,UserID:Int,Token:String)
    case DesignationEdit(Id:Int,Name:String,UserID:Int,Token:String)
    case DesignationDelete(Id:Int,UserID:Int,Token:String)
    case notification(Email:String,DeviceUDID:String,DeviceType:String)
    case registration(FirstName:String,LastName:String,EmailId:String,Password:String,ConfirmPassword:String,Phone:String,UserCategoryId:String,UserTypeId:String,PreferredLocations:String,CompanyId:String)
    case token(grant_type:String,UserName:String,Password:String)
    case forgotPassword(EmailId:String)
    case verifyOTP(OTPNumber:String)
    case resetPassword(OTP:String,Password:String,ConfirmPassword:String)
    case dashboard(Void)
    case userInfo(Void)
    case employeeLocation(Void)
    case list(Void)
    case employeeDocumentList(Void)
    case employeeScheduleList(Year:String,Month:String)
    case clockIn(ScheduleId:Int,ClockIn:Int,Latitude:String,Longitude:String)
    case clockOut(ScheduleId:Int,ClockIn:Int,Latitude:String,Longitude:String,Note:String)
    case subscriptionDetail(UserId:Int,Type:String)
    case staffChnageNumber(UserId:Int, StaffmemberId:Int, Mobilenumber:String, Token:String)
    case SendMessageFromMenu(NewMessageFirstName:String,NewMessageLastName:String,NewMessageMobileNo:String,NewMessageText:String,UserID:Int,Type:Int,Token:String)
    case getCustomerListing(Type:Int,UserID:Int,Token:String,AdminID:Int)
    case getChatListing(Type:Int,UserID:Int,Token:String,CommunicationGUID:String)
    case getSendMessageChatList(Type:Int,UserID:Int,Token:String,MarketingCampaignGUID:String,AdminId:Int)
    case ReplyNewMessage(CampaignId:Int,CampaignGUID:String,CommunicationGUID:String,ReplyFrom:String,Message:String,UserID:Int,Type:Int,Token:String, AdminId:String)
    
    case getContactToUserDropDownList(AdminId:Int,Token:String,Type:Int,UserID:Int,UserType:Int)
    
    case getContactToUserGetUsersList(AdminId:Int,ContactGroup:Int,Departmentid:Int,Designationid:Int,Token:String,Type:Int,UserID:Int,UserType:Int)

    case SendMessagetoUsers(AdminId:Int,MeesageTouserList:[[String:Any]],MessageText:String,Subject:String,Token:String,Type:Int,UserID:Int)
    
    case ReceiveKeywordList(UserID:Int,Type:Int,AdminId:Int,Token:String)
    case AcceptKeyword(UserID:Int,Type:Int,AdminId:Int,Token:String,CampaignGUID:String,ReplyFrom:String)
    
    func dictionary() -> Dictionary<String, AnyObject> {
        
        switch self {
        
        
        case .notification(Email : let Email,DeviceUDID : let DeviceUDID,DeviceType : let DeviceType):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VEmail]   = Email;
            requestDictionary[StaticNameOfVariable.VDeviceUDID]   = DeviceUDID;
            requestDictionary[StaticNameOfVariable.VDeviceType]   = DeviceType;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .registration(FirstName:let FirstName,LastName:let LastName,EmailId:let EmailId,Password:let Password,ConfirmPassword:let ConfirmPassword,Phone:let Phone,UserCategoryId:let UserCategoryId,UserTypeId:let UserTypeId,PreferredLocations:let PreferredLocations,CompanyId:let CompanyId):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VEmailId]   = EmailId;
            
            requestDictionary[StaticNameOfVariable.VFirstName]   = FirstName;
            requestDictionary[StaticNameOfVariable.VLastName]   = LastName;
            requestDictionary[StaticNameOfVariable.VPassword]   = Password;
            requestDictionary[StaticNameOfVariable.VConfirmPassword]   = ConfirmPassword;
            requestDictionary[StaticNameOfVariable.VPhone]   = Phone;
            requestDictionary[StaticNameOfVariable.VUserCategoryId]   = UserCategoryId;
            requestDictionary[StaticNameOfVariable.VUserTypeId]   = UserTypeId;
            
            requestDictionary[StaticNameOfVariable.VPreferredLocations]   = PreferredLocations;
            requestDictionary[StaticNameOfVariable.VCompanyId]   = CompanyId;
            
            return requestDictionary as Dictionary<String, AnyObject>
            
            
            
        case .token(grant_type : let grant_type,UserName : let UserName,Password : let Password):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.Vgrant_type]   = grant_type;
            requestDictionary[StaticNameOfVariable.VUserName]   = UserName;
            requestDictionary[StaticNameOfVariable.VPassword]   = Password;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .forgotPassword(EmailId : let EmailId):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VEmailId]   = EmailId;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .verifyOTP(OTPNumber : let OTPNumber):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VOTPNumber]   = OTPNumber;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .resetPassword(OTP: let OTP,Password : let Password,ConfirmPassword: let ConfirmPassword):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VPassword]   = Password;
            requestDictionary[StaticNameOfVariable.VConfirmPassword]   = ConfirmPassword;
            requestDictionary[StaticNameOfVariable.VOTP]   = OTP;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .dashboard():
            var requestDictionary : Dictionary<String,String> = Dictionary()
            return requestDictionary as Dictionary<String, AnyObject>
        case .userInfo():
            var requestDictionary : Dictionary<String,String> = Dictionary()
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .employeeLocation():
            var requestDictionary : Dictionary<String,String> = Dictionary()
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .list():
            var requestDictionary : Dictionary<String,String> = Dictionary()
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .employeeDocumentList():
            var requestDictionary : Dictionary<String,String> = Dictionary()
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .employeeScheduleList(Year : let Year,Month : let Month):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VYear]   = Year;
            requestDictionary[StaticNameOfVariable.VMonth]   = Month;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .clockIn(ScheduleId : let ScheduleId, ClockIn : let ClockIn, Latitude: let Latitude, Longitude : let Longitude):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VScheduleId]   = ScheduleId;
            requestDictionary[StaticNameOfVariable.VClockIn]   = ClockIn;
            requestDictionary[StaticNameOfVariable.VLatitude]   = Latitude;
            requestDictionary[StaticNameOfVariable.VLongitude]   = Longitude;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .clockOut(ScheduleId : let ScheduleId, ClockIn : let ClockIn, Latitude: let Latitude, Longitude : let Longitude, Note : let Note):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VScheduleId]   = ScheduleId;
            requestDictionary[StaticNameOfVariable.VClockIn]   = ClockIn;
            requestDictionary[StaticNameOfVariable.VLatitude]   = Latitude;
            requestDictionary[StaticNameOfVariable.VLongitude]   = Longitude;
            requestDictionary[StaticNameOfVariable.VNote]   = Note;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .login(Email: let Email, Password: let Password):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VEmail]   = Email;
            requestDictionary[StaticNameOfVariable.VPassword]   = Password;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .forgotPasswordSentMail(Email: let Email):
            var requestDictionary : Dictionary<String,String> = Dictionary()
            requestDictionary[StaticNameOfVariable.VEmail]   = Email;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .ResetPassword(OldPassword: let OldPassword, NewPassword: let NewPassword, ConfirmPassword: let ConfirmPassword,  id: let id):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.OldPassword]   = OldPassword;
            requestDictionary[StaticNameOfVariable.NewPassword]   = NewPassword;
            requestDictionary[StaticNameOfVariable.ConfirmPassword]   = ConfirmPassword;
            requestDictionary[StaticNameOfVariable.id]  = id;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .GetProfile(UserID: let Userid, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .GetCountry(Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .GetState(Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .EditProfileDetail(Name: let Name, LastName: let LastName, Email: let Email, Password: let Password, UserID: let UserID, Type: let Type, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.Name]   =  Name;
            requestDictionary[StaticNameOfVariable.LastName]   =  LastName;
            requestDictionary[StaticNameOfVariable.Email]   =  Email;
            requestDictionary[StaticNameOfVariable.Password]   =  Password;
            requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
            requestDictionary[StaticNameOfVariable.VType]   =  Type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .EditOrganization(OrganizationId: let OrganizationId, OrganizationName: let OrganizationName, Description: let Description, Datapurge: let Datapurge, website: let website, Country: let Country, state: let state, city: let city, ZipCode: let ZipCode, UserID: let UserID, Type: let Type, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.OrganizationId]   =  OrganizationId;
            requestDictionary[StaticNameOfVariable.OrganizationName]   =  OrganizationName;
            requestDictionary[StaticNameOfVariable.Description]   =  Description;
            requestDictionary[StaticNameOfVariable.Datapurge]   =  Datapurge;
            requestDictionary[StaticNameOfVariable.website]   =  website;
            requestDictionary[StaticNameOfVariable.Country]   =  Country;
            requestDictionary[StaticNameOfVariable.state]   =  state;
            requestDictionary[StaticNameOfVariable.city]   =  city;
            requestDictionary[StaticNameOfVariable.ZipCode]   =  ZipCode;
            requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
            requestDictionary[StaticNameOfVariable.VType]   =  Type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .StaffMemberList(UserID: let Userid, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .View(id: let id):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .Delete(id: let id, UserID: let Userid):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .DepartmentList(UserID: let Userid, Type: let type, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .AddDepartment(Name: let Name, UserID: let Userid, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.Name]   =  Name;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .EditDepartment(Name: let Name, UserID: let Userid, Token: let Token, id: let id):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.Name]   =  Name;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.id]   =  id;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .DeleteDepartment(id: let id, UserID: let Userid, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .DesignationList(UserID: let Userid, Type: let type, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .Edit(FirstName: let firstName, LastName: let lastName,  Department: let department, Designation: let designation, Mobilenumber: let mobilenumber, Email: let email, WorkTimings: let workTimings, Country: let country, State: let state, ZipCode: let zipCode, IsUser: let isUser,IP: let ip,Id: let id,  CityName: let cityName, UserID: let Userid, Type: let type, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VFirstName]   =  firstName;
            requestDictionary[StaticNameOfVariable.VLastName]   =  lastName;
            requestDictionary[StaticNameOfVariable.Department]   =  department;
            requestDictionary[StaticNameOfVariable.Designation]   =  designation;
            requestDictionary[StaticNameOfVariable.Mobilenumber]   =  mobilenumber;
            requestDictionary[StaticNameOfVariable.Email]   =  email;
            requestDictionary[StaticNameOfVariable.WorkTimings]   =  workTimings;
            requestDictionary[StaticNameOfVariable.Country]   =  country;
            requestDictionary[StaticNameOfVariable.state]   =  state;
            requestDictionary[StaticNameOfVariable.ZipCode]   =  zipCode;
            requestDictionary[StaticNameOfVariable.IsUser]   =  isUser;
            requestDictionary[StaticNameOfVariable.IP]   =  ip;
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.CityName]   =  cityName;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .StaffMemberSave(FirstName: let firstName, LastName: let lastName,  Department: let department, Designation: let designation, Mobilenumber: let mobilenumber, Email: let email, WorkTimings: let workTimings, Country: let country, State: let state, ZipCode: let zipCode, IsUser: let isUser,IP: let ip,CityName: let cityName, UserID: let Userid, Type: let type, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VFirstName]   =  firstName;
            requestDictionary[StaticNameOfVariable.VLastName]   =  lastName;
            requestDictionary[StaticNameOfVariable.Department]   =  department;
            requestDictionary[StaticNameOfVariable.Designation]   =  designation;
            requestDictionary[StaticNameOfVariable.Mobilenumber]   =  mobilenumber;
            requestDictionary[StaticNameOfVariable.Email]   =  email;
            requestDictionary[StaticNameOfVariable.WorkTimings]   =  workTimings;
            requestDictionary[StaticNameOfVariable.Country]   =  country;
            requestDictionary[StaticNameOfVariable.state]   =  state;
            requestDictionary[StaticNameOfVariable.ZipCode]   =  zipCode;
            requestDictionary[StaticNameOfVariable.IsUser]   =  isUser;
            requestDictionary[StaticNameOfVariable.IP]   =  ip;
            requestDictionary[StaticNameOfVariable.CityName]   =  cityName;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
            
        case .DepartmentAdd(Name: let name, UserID: let Userid,Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VName]   =  name;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .DepartmentEdit(Id: let id, Name: let name, UserID: let Userid,Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.VName]   =  name;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .DepartmentDelete(Id: let id,  UserID: let Userid,Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .DesignationAdd(Name: let name, UserID: let Userid,Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VName]   =  name;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .DesignationEdit(Id: let id, Name: let name, UserID: let Userid,Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.VName]   =  name;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case .DesignationDelete(Id: let id,  UserID: let Userid,Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.id]   =  id;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .subscriptionDetail(UserId: let Userid, Type: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .staffChnageNumber(UserId: let UserId, StaffmemberId: let StaffmemberId, Mobilenumber: let Mobilenumber, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  UserId;
            requestDictionary[StaticNameOfVariable.StaffMemberID]   =  StaffmemberId;
            requestDictionary[StaticNameOfVariable.Mobilenumber]   =  Mobilenumber;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .SendMessageFromMenu(NewMessageFirstName: let FirstName, NewMessageLastName: let LastName, NewMessageMobileNo: let MobileNo, NewMessageText: let NewMessage, UserID: let UserID, Type: let type, Token: let Token):
            
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
            requestDictionary[StaticNameOfVariable.VNewMessageFirstName] =  FirstName;
            requestDictionary[StaticNameOfVariable.VNewMessageLastName]  =  LastName;
            requestDictionary[StaticNameOfVariable.VNewMessageMobileNo]  =  MobileNo;
            requestDictionary[StaticNameOfVariable.VNewMessageText]   = NewMessage;
            requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .getCustomerListing(Type: let type, UserID: let UserID, Token: let Token, AdminID: let AdminID):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminID;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .getChatListing(Type: let type, UserID: let UserID, Token: let Token, CommunicationGUID: let CommunicationGUID):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.VCommunicationGUID]   =  CommunicationGUID;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case .getSendMessageChatList(Type: let type, UserID: let userID, Token: let Token, MarketingCampaignGUID: let MarketingCampaignGUID, AdminId: let AdminId):
           
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.UserID]   =  userID;
            requestDictionary[StaticNameOfVariable.VMarketingCampaignGUID]   =  MarketingCampaignGUID;
            requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
            return requestDictionary as Dictionary<String, AnyObject>
       
        
        case .ReplyNewMessage(CampaignId: let CampaignId, CampaignGUID: let CampaignGUID, CommunicationGUID: let CommunicationGUID, ReplyFrom: let ReplyFrom, Message: let Message, UserID: let userID, Type: let type, Token: let Token, AdminId: let AdminId):
            
        var requestDictionary : Dictionary<String,Any> = Dictionary()
        
        requestDictionary[StaticNameOfVariable.VCampaignId]   = CampaignId;
        requestDictionary[StaticNameOfVariable.VCampaignGUID]   =  CampaignGUID;
        requestDictionary[StaticNameOfVariable.VCommunicationGUID]   =  CommunicationGUID;
        requestDictionary[StaticNameOfVariable.VReplyFrom]   =  ReplyFrom;
        requestDictionary[StaticNameOfVariable.VMessage]   =  Message;
        requestDictionary[StaticNameOfVariable.VType]   =  type;
        requestDictionary[StaticNameOfVariable.Token]   =  Token;
        requestDictionary[StaticNameOfVariable.UserID]   =  userID;
        requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
        return requestDictionary as Dictionary<String, AnyObject>
            
            
        case.getContactToUserDropDownList(AdminId: let AdminId, Token: let Token, Type: let Type, UserID: let Userid, UserType: let UserType):
 
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.VType]   =  Type;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.VUserType]   =  UserType;
            return requestDictionary as Dictionary<String, AnyObject>
            
            
        case.getContactToUserGetUsersList(AdminId: let AdminId, ContactGroup: let ContactGroup, Departmentid: let Departmentid, Designationid: let Designationid, Token: let Token, Type: let Type, UserID: let Userid, UserType: let UserType):
           
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
            requestDictionary[StaticNameOfVariable.VContactGroup]   =  ContactGroup;
            requestDictionary[StaticNameOfVariable.VDepartmentid]   =  Departmentid;
            requestDictionary[StaticNameOfVariable.VDesignationid]   =  Designationid;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.VType]   =  Type;
            requestDictionary[StaticNameOfVariable.UserID]   =  Userid;
            requestDictionary[StaticNameOfVariable.VUserType]   =  UserType;
        return requestDictionary as Dictionary<String, AnyObject>
            
        case.SendMessagetoUsers(AdminId: let AdminId, MeesageTouserList: let MeesageTouserList, MessageText: let MessageText, Subject: let Subject, Token: let Token, Type: let Type, UserID: let UserID):
            
        var requestDictionary : Dictionary<String,Any> = Dictionary()
        requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
        requestDictionary[StaticNameOfVariable.VMeesageTouserList]   =  MeesageTouserList;
        requestDictionary[StaticNameOfVariable.VMessageText]   =  MessageText;
        requestDictionary[StaticNameOfVariable.VSubject]   =  Subject;
        requestDictionary[StaticNameOfVariable.Token]   =  Token;
        requestDictionary[StaticNameOfVariable.VType]   =  Type;
        requestDictionary[StaticNameOfVariable.UserID]   =  UserID;
        return requestDictionary as Dictionary<String, AnyObject>
            
            
        case.ReceiveKeywordList(UserID: let userID, Type: let type, AdminId: let AdminId, Token: let Token):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  userID;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            return requestDictionary as Dictionary<String, AnyObject>
            
        case.AcceptKeyword(UserID: let userID, Type: let type, AdminId: let AdminId, Token: let Token, CampaignGUID: let CampaignGUID, ReplyFrom: let ReplyFrom):
            var requestDictionary : Dictionary<String,Any> = Dictionary()
            requestDictionary[StaticNameOfVariable.UserID]   =  userID;
            requestDictionary[StaticNameOfVariable.VType]   =  type;
            requestDictionary[StaticNameOfVariable.VAdminID]   =  AdminId;
            requestDictionary[StaticNameOfVariable.Token]   =  Token;
            requestDictionary[StaticNameOfVariable.VCampaignGUID]   =  CampaignGUID;
            requestDictionary[StaticNameOfVariable.VReplyFrom]   =  ReplyFrom;
            return requestDictionary as Dictionary<String, AnyObject>
            
        break
            
        default:
            var emptyDictionary = Dictionary<String, AnyObject>()
            return emptyDictionary
        }
    }
}





