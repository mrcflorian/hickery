//
//  HickeryAPI.swift
//  Hickery
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class HickeryAPI: NSObject {
    class func requestLikes(userID: String, completionHandler: ((Array<HickerySong>) -> Void)?)
    {
        let params = ["user_id":userID]
        let request = NLFNucleusAPIRequest(params:params, path:"likes.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                var songsList = Array<HickerySong>()
                var likesArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as Array<NSDictionary>
                for jsonDictionary in likesArray {
                    songsList.append(HickerySong(jsonDictionary: jsonDictionary))
                }
                completionHandler!(songsList)
            }
        }
    }

    class func requestUser(email: String, completionHandler: ((HickeryUser) -> Void)?)
    {
        let params = ["email":email]
        let request = NLFNucleusAPIRequest(params:params, path:"user.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if (completionHandler != nil) {
                var songsList = Array<HickerySong>()
                var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                completionHandler!(HickeryUser(jsonDictionary: jsonDictionary))
            }
        }
    }
}
