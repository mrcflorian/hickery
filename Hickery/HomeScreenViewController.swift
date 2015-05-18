//
//  HomeScreenViewController.swift
//  Hickery
//
//  Created by Florian Marcu on 4/9/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class HomeScreenViewController: NLFNucleusViewController {

    @IBOutlet var childrenContainerView: UIView!
    
    var playlistVC: PlaylistViewController?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFetchFacebookUser:", name: kFacebookManagerDidFetchUserNotification, object: nil)
        FacebookAPIManager.startFetchingDataForCurrentUser()
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kFacebookManagerDidFetchUserNotification, object: nil)
    }
    
    func didFetchFacebookUser(notification: NSNotification)
    {
        HickeryAPI.requestUser(notification.object as! String, completionHandler: { (user) -> Void in
            HickeryAPI.requestLikes(user.userID, completionHandler: { (songsList) -> Void in
                if self.playlistVC != nil {
                    self.playlistVC!.songs = songsList;
                }
            })
        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "embedPlaylistVC") {
            self.playlistVC = segue.destinationViewController as? PlaylistViewController
        }
    }
}
