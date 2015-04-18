//
//  PlaylistViewController.swift
//  Hickery
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class PlaylistViewController: NLFNucleusViewController {
    @IBOutlet var childrenContainerView: UIView!

    var youtubePlayerVC: NLFYoutubePlayerViewController?
    var songTableVC: SongTableViewController?

    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.youtubePlayerVC?.playYoutubeVideo("zPP6lXaL7KA")
    }
    
    var songs: Array<HickerySong>?
        {
        set {
            songTableVC?.songs = newValue
        }
        get {
            return songTableVC?.songs
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "embedSongTableVC") {
            self.songTableVC = segue.destinationViewController as? SongTableViewController
        } else if (segue.identifier == "embedYoutubePlayerVC") {
            self.youtubePlayerVC = segue.destinationViewController as? NLFYoutubePlayerViewController
        }
    }
}
