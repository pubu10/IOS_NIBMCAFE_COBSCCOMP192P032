//
//  CustomerBL.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-07.
//
import Firebase
import UIKit

public class CustomerBL: NSObject {
    
    public var db: Firestore? //Property Injection
   
    override init() {
        self.db = Firestore .firestore()
       
    }
    
     func CreateCustomerAccount(oModel : UserModel) -> Bool {
        var chk : Bool = false
        
        oModel.CustomerId = self.CreateUserInFirbase(email: oModel.email, password: oModel.Password)
        
        if(oModel.CustomerId != "")
        {
            db?.collection(oModel.Collection).document(oModel.CustomerId).setData(oModel.dictionaryRepresentation) { err in
                if ( err == nil )
                {
                    chk = true
                }
            }
        }
       
       return chk;
    }
    
    func CreateUserInFirbase( email: String,password : String) -> String {
        
        var userID : String = ""
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          
            if(authResult != nil)
            {
                userID = (authResult?.user.uid)! as String
            }
        }
        return userID
       
    }
    
   
    
}
