//
//  AccountBL.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-07.
//

import UIKit
import Firebase

public class AccountBL: NSObject {
    
    public var db: Firestore? //Property Injection
    
    override init() {
        self.db = Firestore .firestore()
    }

    public func AccountCreate(_oModel :TestModel) -> Bool {

//        db?.collection("cities").document("sri lanka100").setData(_oModel.dictionaryRepresentation) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
        return true;

    }
}
