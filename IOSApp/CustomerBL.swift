//
//  CustomerBL.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-07.
//
import Firebase
//import UIKit

public class CustomerBL: NSObject {
    
    public var db: Firestore? //Property Injection
   
    override init() {
        self.db = Firestore .firestore()
       
    }
    
     func CreateCustomerAccount(oModel : UserModel) -> Bool {
        var chk : Bool = false
        
        if(oModel.CustomerId != "")
            {
                self.db?.collection(oModel.Collection).document(oModel.CustomerId).setData(oModel.dictionaryRepresentation) { err in
                    if ( err == nil )
                    {
                        chk = true
                    }
                }
            }
       return chk;
    }
    
    func CreateUserInFirbase( oModel : UserModel) -> Bool {
        
        var Check : Bool = false
        
        Auth.auth().createUser(withEmail: oModel.email, password: oModel.password) { authResult, error in
                
                if(authResult != nil)
                {
                    oModel.CustomerId = (authResult?.user.uid)! as String
                    Check = self.CreateCustomerAccount(oModel: oModel)
                }
        }
        return Check
        
    }
    
    func SignIn(Email : String,Password : String) -> Bool{
        var Check : Bool = false
        //let group = DispatchGroup.init()
       // group.enter()
        
        
        Auth.auth().signIn(withEmail: Email, password: Password) { (authResult, error) in
            
                  if let error = error as NSError? {
                  switch AuthErrorCode(rawValue: error.code) {
                  case .operationNotAllowed:
                      print( "Email is not allowed..!")
                      break
                  case .userDisabled:
                    print( "The user account has been disabled by an administrator.")
                  break
                  case .invalidEmail:
                    print( "The email address is badly formatted.")
                  break
                  case .wrongPassword:
                    print( "The user name or password is invalid ")
                    break
                  default:
                    print( "Error")
                  }
                } else {
                    print("User signs in successfully..!")
                    Check = true
                }
            
          }
        
        return Check
    }
    
}
