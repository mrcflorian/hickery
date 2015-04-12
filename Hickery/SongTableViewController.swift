//
//  SongTableViewController.swift
//  Hickery
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework
import UIKit

class SongTableViewController: NLFNucleusTableViewController
{
    var songsArray: Array<HickerySong>?

    var songs: Array<HickerySong>?
    {
        set {
            songsArray = newValue
            self.songsListDidUpdate()
        }
        get {
            return songsArray
        }
    }
    
    func songsListDidUpdate()
    {
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let reuseIndentifier = "hickery.song.cell.identifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIndentifier) as HickerySongCell?
        if cell == nil {
            cell = HickerySongCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIndentifier)
        }
        if (songsArray != nil) {
            cell?.textLabel!.text = (songsArray![indexPath.row] as HickerySong).title
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (songsArray != nil) {
            return songsArray!.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 51
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
}
