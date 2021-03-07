//
//  UserModel.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-07.
//

import UIKit

class UserModel: NSObject {

    public var Collection :String = "CustomerModel" // Database Collection name
    public var CustomerId: Int = 100
    public var Name: String = ""
    public var Address: String = ""
    public var Email: String = ""
    public var TelNo: Int = 0
    public var Password:String=""
    
    var dictionaryRepresentation: [String: Any] {
        return [
            "CustomerId" : CustomerId,
            "Name" : Name,
            "Address" : Address,
            "Email" : Email,
            "TelNo" : TelNo,
            "Password" : Password,
        ]
    }
    
    public var collection: String{
        return self.Collection
    }

    public var customerId: Int {
        get {
            return self.CustomerId;
        }
        set {
            if  newValue > 0 {
                //fatalError("invalid value for CustomerId")
            } else {
                self.CustomerId = newValue
            }
        }
    }
    public var name: String {
        get {
            return self.Name;
        }
        set {
            if  newValue != "" {
                //fatalError("invalid value for Name")
            } else {
                self.Name = newValue
            }
        }
    }
    
    public var address: String {
        get {
            return self.Address;
        }
        set {
            if  newValue != "" {
                //fatalError("invalid value for Address")
            } else {
                self.Address = newValue
            }
        }
    }
    
    public var email: String {
        get {
            return self.Email;
        }
        set {
            if  newValue != "" {
               // fatalError("invalid value for Email")
            } else {
                self.Email = newValue
            }
        }
    }
    
    public var telNo: Int {
        get {
            return self.TelNo;
        }
        set {
            if  newValue != 0 {
                //fatalError("invalid value for TelNo")
            } else {
                self.TelNo = newValue
            }
        }
    }
    
    
    public var password: String {
        get {
            return self.Password;
        }
        set {
            if  newValue != "" {
                //fatalError("invalid value for Password")
            } else {
                self.Password = newValue
            }
        }
    }
    
}
