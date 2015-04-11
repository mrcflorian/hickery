//
//  LandingScreenViewController.swift
//  Hickery
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class LandingScreenViewController: NLFNucleusViewController
{

    let permissions: [AnyObject] = ["email", "public_profile", "user_friends", "user_location"]

    @IBOutlet var facebookLoginButton: NSLayoutConstraint!

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
        self.goToHomeScreen();
    }
    
    func goToHomeScreen()
    {
        let storyboard = UIStoryboard(name:"HickeryMain", bundle:nil)
        let viewController = storyboard.instantiateInitialViewController() as UIViewController
        self.presentViewController(viewController, animated:true, completion:nil)
    }
}
