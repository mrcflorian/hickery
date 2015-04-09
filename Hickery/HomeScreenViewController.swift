//
//  HomeScreenViewController.swift
//  Hickery
//
//  Created by Florian Marcu on 4/9/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    let permissions: [AnyObject] = ["email", "public_profile", "user_friends", "user_location"]

    @IBAction func didTapLoginButton(sender: UIButton) {
        FBSDKLoginManager().logInWithReadPermissions(permissions, handler: handleFacebookLoginResponse)
    }
    
    func handleFacebookLoginResponse(result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error != nil {
            self.handleFacebookLoginError(error)
        } else if (result.isCancelled) {
            self.handleFacebookLoginCancellation(result)
        } else {
            self.handleFacebookLoginSuccess(result);
        }
    }
    
    func handleFacebookLoginError(error: NSError!)
    {
    }
    
    func handleFacebookLoginCancellation(result: FBSDKLoginManagerLoginResult!)
    {
    }
    
    func handleFacebookLoginSuccess(result: FBSDKLoginManagerLoginResult!)
    {
        if result.grantedPermissions.containsObject("email") {
            self.fetchData()
        }
    }
    
    func fetchData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as NSString
                println("User Email is: \(userEmail)")
            }
        })
    }

}

