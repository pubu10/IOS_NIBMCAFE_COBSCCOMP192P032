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
        db?.collection("test").document("documant").setData(oModel.dictionaryRepresentation) { err in
            if ( err != nil )
            {
                chk = true
            }
        }
       return chk;
        
    }
}
