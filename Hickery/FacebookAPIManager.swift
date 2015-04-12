//
//  FacebookAPIManager.swift
//  Hickery
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

let kFacebookManagerDidFetchUserNotification = "kFacebookManagerDidFetchUserNotification"
let kFacebookManagerPermissions: [AnyObject] = ["email", "public_profile", "user_friends", "user_location"]

class FacebookAPIManager: NSObject {
    class func startFetchingDataForCurrentUser()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            if ((error) != nil) {
                println("Error: \(error)")
            } else {
                NSNotificationCenter.defaultCenter().postNotificationName(kFacebookManagerDidFetchUserNotification, object:result.valueForKey("email") as NSString)
            }
        })
    }
}
