//
//  Constant.swift
//  Algo
//
//  Created by xceltec-46 on 10/9/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

let countryCode : String = "+91"
let REQUAEST_TIME = 50.0

let RED_COLOR = UIColor.init(red: 255.0/255.0, green: 64.0/255.0, blue: 1.0/255.0, alpha: 1.0)
let CUSTOM_WHITE = UIColor.init(red: 235.0/255.0, green: 238.0/255.0, blue: 240.0/255.0, alpha: 1.0)
let FONT = UIFont.init(name: "GoogleSans-Medium", size: 14.0)

let RED_COLOR_OPQ = UIColor.init(red: 255.0/255.0, green: 64.0/255.0, blue: 1.0/255.0, alpha: 0.4)

let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate

let ThemeTabUnselectedColor = UIColor.white
let ThemeTabSelectedColor = #colorLiteral(red: 0.03137254902, green: 0.4392156863, blue: 0.7176470588, alpha: 1)


//let ENTRY_STORY = UIStoryboard.init(name: "Entry", bundle:nil)
//let HOME_STORY = UIStoryboard.init(name: "Home", bundle: nil)

//let MAIN_STORY = UIStoryboard.init(name: "Main", bundle: nil)


let MAIN_STORY = UIStoryboard.init(name: "Main", bundle: nil)

let SYMBOL = USERDEFAULT.object(forKey: "currency_symbol") as? String ?? ""

let TOAST_TIME = 4.0
let USERDEFAULT = UserDefaults.standard
let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
let USER_DEVICE_ID = UIDevice.current.identifierForVendor!.uuidString

// response parameter key

let EncryptKey = "UXVlc3RlclByb2plY3RUaXBwZXI="
let CODE = "code"
let MESSAGE = "message"
let DATA = "data"
//let STATUS = "status"
let SUCCESS = "200"
let ALERT_MESSAGE = "Please choose Pickup Time"
let PAYMENT_MESSAGE = "Please choose Payment"
let ADDRESS_MESSAGE = "Please choose ADDERESS"
let NOTIFICATION_MESSAGE = "Please choose Notification"
let ERROR_MESSAGE = "Server not responding"
let CODE_ERROR = "Your account is deactivated"
let fcmtoken = "fcmtoken"
let ADD_MENU_ERROR = "Please add menu"

let kAccess_Token = "access_token"
let kUser_Device_Id = "user_device_id"
let kLanguage = "language"
let kRole = "role"

let kUser_Id = "user_id"
let kName = "name"
let kEmail = "email"
let kMobile = "mobile_no"
let kPhone = "phone"
let kExpertise = "expertise"
let kOtp = "otp"
let kPassword = "password"
let kConfirmPassword = "confirm_password"
let kCountry = "country"
let kState = "state"
let kCity = "city"
let kfav = "favourite"



// response parameter

let STATUS = "status"

// PARAMETER

let USERNAME = "username"
let EMAIL = "email"
let PASSWORD = "password"
let FIRST_NAME = "first_name"
let LAST_NAME = "last_name"
let MOBILE = "mobile"
let REFERRAL_NO = "referral_no"
let REWARD_TIME = "reward_time"



let USER_ID = "user_id"
let USER_EMAIL = "user_email"
let USER_ROLE = "user_role"
let USER_BANNER = "user_banner"
let USER_IMAGE = "user_image"
let OLD_PASS = "old_password"
let NEW_PASS = "new_password"
let MAIN_CAT_ID = "main_category_id"
let SUB_CAT_ID = "sub_category_id"


// Social Login parameters
let OAUTH_ID = "oauth_id"
let OAUTH_PROVIDER = "oauth_provider"


// Edit profile parameters
let USER_tagline : String = "tagline"
let USER_firstname : String = "first_name"
let USER_lastname : String = "last_name"
let USER_mobile : String = "mobile"
let USER_birthdate : String = "birthday"
let USER_education : String = "education"
let USER_income : String = "income"
let USER_employement : String = "employment"
let USER_address : String = "address"
let USER_country : String = "user_country"
let USER_state : String = "user_state"
let USER_city : String = "user_city"
let USER_zip : String = "zip_code"
let USER_Country_key : String = "user_countrykey"
let USER_City_key : String = "user_citykey"
let USER_State_key : String = "user_statekey"


let USER_profile : String = "profile"
let USER_user : String = "user"
let USER_userbg : String = "usrbg"
let USER_invite : String = "email_phone_list"

// Fetch Products List Parameter

let MAIN_CATGORY_PRODUCTS = "maincategory"
let SUB_CATGORY_PRODUCTS = "subcategory"
let SUB_SUB_CATGORY_PRODUCTS = "sub2category"
let CATEGORY_ID = "category_id"
let PRODUCTS_FOR = "products_for"
let PAGE = "page"
let PRODUCT_ID = "product_id"
let RATING = "rating"
let COMMENTS = "comment"
let TIME_OUT = 50
// Filter parameters

let MAIN_CATAGORY_ID = "main_cat_id"
let SUB_CATAGORY_ID = "sub_cat_id"
let SUB2_CATAGORY_ID = "sub2_cat_id"
let VENDOR_ID = "vendor_id"
let PRICE_RANGE = "price_range"
let WITH_OUT_AMPLE_FILTER = "without_ample"
let MSG_SUBJECT = "msg_subject"
let MSG_DETAILS = "msg_detail"
let MSG_FILES = "msgfiles"
let MALL_ID = "mall_id"
let GIVEAWAY_ID = "giveway_id"
let NO_OF_ENTRY = "no_of_entry"
let CAT_ID = "cat_id"
let INTEREST_ACTION = "interest_action"
let DELIVERY_TYPE = "delivery_type"
let QAUNTITY = "quantity"
let NEW_PRICE_AMPLE = "newitem_pricebyamples"
let APPLIED_AMPLE = "applied_amples"

// FLASH SALE STATIC PARAMETER

let FLASH_ID = "217"
let FLASH_TITLE = "FLASH SALE"
let FLASH_BANNER = ["1515924611_t__1920x7504.jpg","1515924611_t__1920x7503.jpg","1515924611_t__1920x7501.jpg","1515924611_t__1920x750.jpg"]
let FLASH_LOGO = "https://amplepoints.com/vendor-data/217/profile/1516218091_t_12_original.gif"

let msgemailormobile = "Please enter email or phone"
let msgvalidemail = "Please enter valid email"
let msgmobile = "Please enter phone"
let msgvalidmobile = "Please enter valid mobile number"
let msgInternet = "No internet connection"

// API
//http://yemekvaktadmin.xceltec.com/public/api
//let MAIN_URL = "http://yemekvaktadmin.xceltec.com/public/api"
//let CATEGORY_THUMBNAIL_BASE = "https://amplepoints.com/category_images/thumbnails/"
//let SUBCAT_THUMBNAIL_BASE = "https://amplepoints.com/category_images/thumbnails/"
//let SUB_SUBCAT_THUMBNAIL_BASE = "https://amplepoints.com/category_images/thumbnails/"
//
//let SOCIAL_LOGIN = MAIN_URL + "/social-signup"
//let LOGIN =  MAIN_URL + "/login"
//
//let SENDOTP_URL = MAIN_URL + "/otp"
//let VERIFYOTP_URL = MAIN_URL + "/verify-otp"
//let SIGNUP = MAIN_URL + "/register"
//let FORGOTPASSWORD_OTP = MAIN_URL + "/forgot-password-otp"
//let FORGOTPASSWORD_VERIFYOTP = MAIN_URL + "/forgotpassword-verify-otp"
//let FORGOTPASS = MAIN_URL + "/forgotpassword"
//let LOGOUT = MAIN_URL + "/logout"
//let CHANGE_PASSWORD = MAIN_URL + "/change-password"
//let FORGOT_CHANGE_PASSWORD = MAIN_URL + "/otp-change-password"
//let UPDATE_PROFILE = MAIN_URL + "/update-profile"
//let FAQ = MAIN_URL + "/faq-list"
//let CMS = MAIN_URL + "/cms"
//let RESTAURANT_FILTER = MAIN_URL + "/restaurant-filter"
//let DASHBOARD_CATAGORY = MAIN_URL + "/category"
//let DASHBOARD_RESTAURANT_LIST = MAIN_URL + "/restaurant-list-new"
//let DASHBOARD_RESTAURANT_BRANCH_LIST = MAIN_URL + "/restaurant-branch-data"
//let ORDER_HISTORY_LIST = MAIN_URL + "/order-history-list"
//let RESERVATION_LIST = MAIN_URL + "/table-reservation-list"
//let ORDER_HISTORY_RRCEIPTS = MAIN_URL + "/order-history-receipts"
//let REVIEWS_LIST = MAIN_URL + "/review-list-new"
//let REASTAURANT_FILTER = MAIN_URL + "/restaurant-filter"
//let RESTAURANT_FAVORITE_LIST = MAIN_URL + "/restaurant-favorite-list"
//let ADD_RESTAURANT_FAVORITE = MAIN_URL + "/add-restaurant-favorite"
//let MENU_LIST = MAIN_URL + "/menu-list"
//let ADD_TABLE_RESERVATION = MAIN_URL + "/add-table-reservation"
//let ADD_REVIEW = MAIN_URL + "/add-review"
//let RESTAURANT_MENU_CATEGORY_LIST = MAIN_URL + "/restaurant-menu-category-list"
//let COUPON_LIST = MAIN_URL + "/promotional-list"
//let ORDER_NOW = MAIN_URL + "/order-add"
//let SAVE_TO_CART = MAIN_URL + "/save-to-cart"
//let BRANCH_CHARGES_DETAILS = MAIN_URL + "/branch-charges-detail"
//let USER_CART_LIST = MAIN_URL + "/user-cart-list"
//let REMOVE_CART = MAIN_URL + "/remove-cart"
//let ORDER_NOTE_ADD = MAIN_URL + "/order-note-add"
//let ORDER_NOTE_LIST = MAIN_URL + "/order-note-list"
//let ADDRESS_LIST = MAIN_URL + "/address-list"
//let ADD_NEW_ADDRESS = MAIN_URL + "/add-new-address"
//let NEW_ADDRESS_DELETE = MAIN_URL + "/new-address-delete"
//let MENU_DRINK_LIST = MAIN_URL + "/menu-drink-list"
//let TABLE_RESERVATION_PAYMENT = MAIN_URL + "/table-reservation-payment"
//let USER_ORDER_STATUS = MAIN_URL + "/user-order-status"
//let DRIVER_LATEST_LAT_LONG = MAIN_URL + "/driver-latest-lat-long"
//let UNLINK_SOCIAL_ACCOUNT = MAIN_URL + "/unlink-social-account"
//let SETTING = MAIN_URL + "/setting"
//let CITY_LIST = MAIN_URL + "/city-list"
//let NOTIFICATION_LIST = MAIN_URL + "/user-notification-list"

//let DISTRICT_LIST = MAIN_URL + "/district-list"
//let NEIGHBORTHOODS_LIST = MAIN_URL + "/neighborhoods-list"

struct myURLs {
    static let LiveURL = "https://www.freemusictribe.com/"
    static let stagingURLs = "http://text2thembackend.sigmasolve.net/"
    static let baseURL = stagingURLs
}

let MAIN_URL = "http://text2thembackend.sigmasolve.net/"
//let LOGIN = MAIN_URL + "/api/account/preRegistrattion"
//let SIGNUP = MAIN_URL + "/api/account/registration"
let LOGIN = MAIN_URL + "/api/Registration/Login"
let SOCIAL_LOGIN = MAIN_URL + "/social_signup"
let LOGOUT = MAIN_URL + "/logout"
let CMS = MAIN_URL + "/cms"
let RELATION_LIST = MAIN_URL + "/relation_list"
let ORDER_HISTORY = MAIN_URL + "/order_history"
let ADD_FAMILYMEMBER = MAIN_URL + "/add_familymember"
let WALLET_TRANSACTION = MAIN_URL + "/wallet_transaction"
let FAMILYMEMBER_LIST = MAIN_URL + "/familymember_list"
let ASTROLOGER_LIST = MAIN_URL + "/astrologer_list"
let QUESTION_LIST = MAIN_URL + "/question_list"
let EDIT_PROFILE = MAIN_URL + "/edit-profile"
let POST_CONSULT = MAIN_URL + "/post-consult"
let GET_FILTERPARAMETER = MAIN_URL + "/get-filterparameter"
let ADD_REVIEW = MAIN_URL + "/add-review"
let PUSH_NOTIFICATION = MAIN_URL + "/push_notofication"
let SENDTO_CONSULT = MAIN_URL + "/sendto_consult"
let GET_QALIST = MAIN_URL + "/get_qalist"

struct Miscellaneous {
    static let APPDELEGATE  = UIApplication.shared.delegate as! AppDelegate
}


struct ApiNames {
    
    static let login                   = "/api/Registration/Login"
    static let ForgotPasswordSendMail        = "/api/Registration/ForgotPasswordSendMail"
    static let resetPassword                      = "/api/Registration/Resetpassword"
    static let GetProfile                      = "/api/Account/GetProfile"
    static let GetCountry                      = "/api/Account/GetCountry"
    static let GetState                      = "/api/Account/GetState"
    static let EditProfileDetail                      = "/api/Account/EditProfileDetail"
    static let EditOrganization                      = "api/Account/EditOrganization"
    static let StaffMemberList                      = "api/StaffMember/StaffMemberList"
    static let View                      = "api/StaffMember/View"
    static let Delete                      = "api/StaffMember/Delete"
    static let DepartmentList                      = "api/Department/DepartmentList"
    static let AddDepartment                     = "api/Department/ADD"
    static let EditDepartment                     = "api/Department/Edit"
    static let DeleteDepartment                     = "api/Department/Delete"
    static let DesignationList                      = "api/Designation/DesignationList"
    static let Edit                      = "api/StaffMember/Edit"
    static let StaffMemberSave                      = "api/StaffMember/StaffMemberSave"
    static let DepartmentAdd                      = "api/Department/ADD"
    static let DepartmentEdit                      = "api/Department/Edit"
    static let DepartmentDelete                      = "api/Department/Delete"
    static let DesignationAdd                   = "api/Designation/ADD"
    static let DesignationEdit                     = "api/Designation/Edit"
    static let DesignationDelete                      = "api/Designation/Delete"
    static let Vnotification                       = "/notification"
    static let Vregistration                       = "/api/account/registration"
    static let Vtoken                              = "/token"
    static let VforgotPassword                     = "/api/account/forgotPassword"
    static let VverifyOTP                          = "/pi/account/verifyOTP"
    static let VresetPassword                      = "/pi/account/resetPassword"
    static let dashboard                      = "/api/dashboard"
    static let userInfo                      = "/api/home/userInfo"
    static let employeelocations                   = "/api/employeelocations"
    static let list                   = "/api/payrolldocument/list"
    static let employeeDocumentList        = "/api/credentialingDocument/employeeDocumentList"
    static let employeeScheduleList        = "/api/employeeSchedule/employeeScheduleList"
    static let clockIn       = "/pi/clock-in"
    static let clockOut       = "/api/clock-out"
    static let SubscriptionDetail = "api/Subscription/SubscriptionDetail"
    static let StaffChangeNumber = "api/Message/StaffmemberMoNochange"
    static let SendMessageFromMenu = "api/Message/SendNewMessage"
    static let ContactMessageList = "api/Message/ContactMessageList"
    static let MessageChatList = "api/Message/MessageChatList"
    static let SendMessageChatList = "api/Message/SendMessageChatList"
    static let ReplyNewMessage = "api/Message/ReplyNewMessage"
    static let ContactToUserDropDownList = "api/Message/ContactToUserDropDownList"
    static let ContactToUserGetUsersList = "api/Message/ContactToUserGetUsersList"
    static let SendMessagetoUsers = "api/Message/SendMessagetoUsers"
    static let ReceiveKeywordList = "api/Message/ReceiveKeywordList"
    static let AcceptKeyword = "api/Message/AcceptKeyword"
    
}



struct myMessages {
    static let INTERNET_CONNECTIVITY_FAIL = "Please check your internet connection and try again"
    static let ERROR = "TextToThem"
    
    static let KPlease_enter_a_User_name = "Please enter an email"
    static let KPlease_enter_a_Password = "Please enter a password"
    static let KPlease_enter_a_Valid_User_name = "Please enter a valid email"
    static let KPlease_enter_Valid_Password = "Please enter a valid password"
    static let KPlease_enter_a_Name = "Please enter a name"
    static let KPlease_enter_a_School = "Please select a school"
    static let KPlease_enter_a_Grade = "Please select a grade"
    static let KPlease_enter_Class = "Please select a classroom"
    static let KPlease_enter_homeroom = "Please select a homeroom"
    static let KPlease_enter_Allergies = "Please select an allergies"
    
    
    static let KPlease_enter_a_FName = "Please enter a first name"
    static let KPlease_enter_a_LName = "Please enter a last name"
    static let KPlease_enter_a_cardnum = "Please enter a card number"
    static let KPlease_enter_a_valid_cardnum = "Please enter a valid card number"
    static let KPlease_enter_a_cardtype = "Please select card type"
    static let KPlease_enter_a_data = "Please select expiration date"
    static let KPlease_enter_a_Valid_data = "Please select valid expiration date"
    static let KPlease_enter_a_cvv = "Please enter a cvv"
    static let KPlease_enter_a_valid_cvv = "Please enter a valid cvv"
    static let KPlease_enter_a_phone = "Please enter a phone"
    static let KPlease_enter_a_Valid_phone = "Please enter a valid phone number"
    static let KPlease_enter_a_Conpass = "Password and Confirm password must be same"
    
    static let KPlease_enter_a_Industry_Type = "Please select Industry Type"
    static let KPlease_enter_a_User_Type = "Please select User Type"
    static let KPlease_enter_a_Message = "Please select Message"
    
    
}

public class Reachabilitys {
    
    class func isConnectedToNetwork() -> Bool {
        
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            print("Not connected")
            return false
        case .online(.wwan):
            print("Connected via WWAN")
            return true
        case .online(.wiFi):
            print("Connected via WiFi")
            return true
        }
    }
}

extension NSObject {
    func makeMyExclusiveToast(alertTitle : String, alertMessage : String) -> Void
    {
        let alert:UIAlertController=UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let cameraAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        {
            UIAlertAction in
        }
        
        alert.addAction(cameraAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func showAlertFor(alertTitle : String, alertMessage : String) -> Void {
        
        let alert:UIAlertController=UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let cameraAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        {
            UIAlertAction in
        }
        
        alert.addAction(cameraAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    
    
    func makeMyToastActivity() -> Void {
        
        Miscellaneous.APPDELEGATE.window!.isUserInteractionEnabled = false
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        SVProgressHUD.show(withStatus: "Loading..")
        
    }
    
    
    func stopMyToastActivity() -> Void {
        //  SVProgressHUD.dismiss()
        Miscellaneous.APPDELEGATE.window!.isUserInteractionEnabled = true
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}


func LocallizedGetString(_ title: String)->String {
    
    let path = Bundle.main.path(forResource: USERDEFAULT.object(forKey: "lan") as? String, ofType: "lproj") //language
    let bundle = Bundle(path: path!)
    return (bundle?.localizedString(forKey: title as String, value: nil, table: nil))!
    // return  LocalizationSystem.sharedLocal().amLocalizedString(title as String, comment: "")
}

let ASK_QUESTION = MAIN_URL + "/askquestion"
let VENDOR_BY_MALL = MAIN_URL + "/getvendorbymall"
let GET_USER_AMPLE = MAIN_URL + "/getuserample"

let USER_CHAIN = MAIN_URL + "/getuserchain"
let GET_INVITELIST = MAIN_URL + "/getuserinvitelist"
let INVITE_FRIEND = MAIN_URL + "/senduserinvitation"
let GET_CART = MAIN_URL + "/getusercart"
let DELETE_FROM_CART = MAIN_URL + "/removetocart"
let GET_USER_INTEREST = MAIN_URL + "/userinterestlist"
let CHANGE_INTEREST = MAIN_URL + "/changeuserinterest"

let RECENT_GIVEAWAY_LIST = MAIN_URL + "/giveawayentry"
let CONTACTUS = "https://amplepoints.com/contact-us"
let TERMS_AND_CONDITIONS = "https://amplepoints.com/terms-conditions"
let ABOUTUS = "https://amplepoints.com/about-us"

let CONTACT_US = MAIN_URL + "/cmspage"
let CONTACT_US_SEND = MAIN_URL + "/submitcontact"
let SUBMIT_DELIVEY = MAIN_URL + "/submitdelivery"
let INCREASEITEMINCART = MAIN_URL + "/addtocart"
let DECREASEITEMINCART = MAIN_URL + "/decreaseitem"
let SEARCH = MAIN_URL + "/searchproduct"
let GET_HOURS = MAIN_URL + "/getvendorhours"
let ADD_TO_CART = MAIN_URL + "/addtocart"
let ADD_TO_CART_AMPLE = MAIN_URL + "/addtocartwithamples"
let ADD_BILLING_INFO = MAIN_URL + "/submitordershipping"
let SHOE_CHECKOUT_DATA = MAIN_URL + "/checkout"
let PAYMENT = MAIN_URL + "/processorder"
let CONTACT_ME_API = MAIN_URL + "/contactme"
let TESTIMONIAL = MAIN_URL + "/vendortestinomial"
let VENDOR_FILTER = MAIN_URL + "/getvendorfilters"

// Constant Message
let msgLoginSuccess = "Login Successfully"
let msgSomethingWentWrong = "Something went wrong"
//let msgInternet : String = "Please check your internet connection and try again!!!"

let msgEmailorMobile = "Please enter your email or mobile number"
let msgName = "Please enter your name"
let msgFirstName = "Please enter your first name"
let msgLastName = "Please enter your last name"
let msgEmail = "Please enter your email"
let msgValidEmail = "Please enter valid email"
let msgMobileNumber = "Please enter your mobile number"
let msgValidMobileNumber = "Please enter minimum 10 digit mobile number"
let msgPassword = "Please enter your password"
let msgConfirmPassword = "Please enter confirm password"
let msgPasswordNotMatch = "Password and confirm password does not match"
let msgNewPasswordNotMatch = "New password and confirm password does not match"
let msgValidPassword  = "Please enter minimum 8 digit password"
let msgExpertise = "Please enter expertise"
let msgCountry = "Please select country"
let msgState = "Please select state"
let msgCity = "Please select city"
let msgCurrentPassword = "Please enter current password"
let msgNewPassword = "Please enter new password"

let msgDrugName = "Please enter drug name"
let msgStartDate = "Select start date"
let msgEndDate = "Select end date"
let msgDosage = "Please enter drug dosages"
let msgInstruction = "Please enter drug instructions"
let msgPhysicianNote = "Please enter physician note"

let msgCopy = "Copied to clipboard"

struct StaticNameOfVariable
{
    
    static let Vemail = "email"
    static let VName = "Name"
    static let VEmail = "Email"
    static let OldPassword = "OldPassword"
    static let NewPassword = "NewPassword"
    static let ConfirmPassword = "ConfirmPassword"
    static let id = "id"
    static let UserID = "UserID"
    static let Token = "Token"
    static let Name = "Name"
    static let LastName = "LastName"
    static let Email = "Email"
    static let Password = "Password"
    static let VType = "Type"
    static let OrganizationId = "OrganizationId"
    static let OrganizationName = "OrganizationName"
    static let Description = "Description"
    static let Datapurge = "Datapurge"
    static let website = "website"
    static let Country = "Country"
    static let state = "State"
    static let city = "city"
    static let ZipCode = "ZipCode"
    static let NetworkEmailId = "NetworkEmailId"
    static let Department = "Department"
    static let Designation = "Designation"
    static let Mobilenumber = "Mobilenumber"
    static let IsUser = "IsUser"
    static let WorkTimings = "WorkTimings"
    static let IP = "IP"
    static let CityName = "CityName"
    static let StaffMemberID = "StaffmemberId"
    
    
    static let VDeviceType = "DeviceType"
    static let VDeviceUDID = "DeviceUDID"
    static let VcustomerId = "customerId"
    
    static let Vkeywords = "keywords"
    static let VApplication = "Application"
    static let Vcount = "count"
    static let VisCountrySelected = "isCountrySelected"
    static let VisEverywhereSelected = "isEverywhereSelected"
    
    
    static let VitemsPerPage = "itemsPerPage"
    static let Vmax = "max"
    static let Vmiles = "min"
    static let Vmin = "min"
    static let VpageNumber = "pageNumber"
    
    static let VparentCategoryId = "parentCategoryId"
    static let Vproduct_location = "product_location"
    
    
    static let VFirstName = "FirstName"
    static let VLastName = "LastName"
    static let VEmailId = "EmailId"
    static let VPassword = "Password"
    static let VConfirmPassword = "ConfirmPassword"
    
    static let VPhone = "Phone"
    static let VUserCategoryId = "UserCategoryId"
    
    static let VUserTypeId = "UserTypeId"
    static let VUserType = "UserType"
    
    static let VPreferredLocations = "PreferredLocations"
    
    static let VCompanyId = "CompanyId"
    static let Vgrant_type = "grant_type"
    static let VUserName = "UserName"
    
    static let VOTPNumber = "OTPNumber"
    static let VOTP = "OTP"
    static let VYear = "Year"
    static let VMonth = "Month"
    static let VScheduleId = "ScheduleId"
    static let VClockIn = "ClockIn"
    static let VLatitude = "Latitude"
    static let VLongitude = "Longitude"
    static let VNote = "Note"
    
    static let VNewMessageFirstName = "NewMessageFirstName"
    static let VNewMessageLastName = "NewMessageLastName"
    static let VNewMessageMobileNo = "NewMessageMobileNo"
    static let VNewMessageText = "NewMessageText"
    
    static let VCommunicationGUID = "CommunicationGUID"
    static let VAdminID = "AdminID"
    static let VContactGroup = "ContactGroup"
    static let VDepartmentid = "Departmentid"
    static let VDesignationid = "Designationid"
    static let VMeesageTouserList = "MeesageTouserList"
    static let VMessageText = "MessageText"
    static let VSubject = "Subject"
    
    
    static let VMarketingCampaignGUID = "MarketingCampaignGUID"
    
    static let VCampaignId = "CampaignId"
    static let VCampaignGUID = "CampaignGUID"
    static let VMessage = "Message"
    static let VReplyFrom = "ReplyFrom"
}



