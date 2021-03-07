//
//  TestModel.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-06.
//

import UIKit

public class TestModel: NSObject {
    
    public var _id: Int = 0
    public var _lastName: String = ""
    
    var dictionaryRepresentation: [String: Any] {
        return [
            "userId" : _id,
            "firstName" : _lastName,
        ]
    }
    
    public init(id: Int, lastName: String) {
        self._id = id
        self._lastName = lastName
    }
    
    public override init() {
        self._id = 0
        self._lastName = ""
    }
    
    public var id: Int {
        get {
            return self._id;
        }
        set {
            if newValue < 0 || newValue > 1000 {
                // Swift setter cannot throw error.
                fatalError("invalid value for id")
            } else {
                self._id = newValue
            }
        }
    }
    
    public var lastName: String {
        get {
            return self._lastName
        }
        set {
            // In Swift, non-optional String can never get nil.
            if newValue.isEmpty {
                fatalError("invalid value for lastName")
            } else {
                self._lastName = newValue
            }
        }
    }
    
}
