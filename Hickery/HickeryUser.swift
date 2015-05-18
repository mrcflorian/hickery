//
//  HickeryUser.swift
//  Hickery
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

class HickeryUser: NSObject {
    var userID: String = ""
    var profileImageURL: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    
    init(facebookID: String)
    {
        userID = HickeryUser.hickeryID(facebookID)
    }
    
    init(jsonDictionary: NSDictionary)
    {
        if (jsonDictionary["hkid"] != nil) {
            userID = jsonDictionary["hkid"] as! String
        }
        if (jsonDictionary["profile_picture"] != nil) {
            profileImageURL = jsonDictionary["profile_picture"] as! String
        }
        if (jsonDictionary["first_name"] != nil) {
            firstName = jsonDictionary["first_name"] as! String
        }
        if (jsonDictionary["last_name"] != nil) {
            lastName = jsonDictionary["last_name"] as! String
        }
    }
    
    class func hickeryID(facebookID: String!) -> String
    {
        var repeatNo = 15 - count(facebookID)
        if repeatNo < 0 {
            repeatNo = 0
        }
        return "99" + facebookID;
    }
}
