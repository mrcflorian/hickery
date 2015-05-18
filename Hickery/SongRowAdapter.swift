//
//  SongRowAdapter.swift
//  Hickery
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class SongRowAdapter: NLFTableRowAdapterProtocol
{
    var x: Int = 10
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> UITableViewCell {
        if !object.isKindOfClass(HickerySong) {
            return UITableViewCell()
        }
        let hickerySong = object as! HickerySong
        let reuseIdentifier = "hickery.song.cell.identifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! HickerySongCell?
        if cell == nil {
            cell = HickerySongCell(reuseIdentifier: reuseIdentifier)
        }
        dispatch_async(dispatch_get_main_queue()) {
            cell?.songTextView?.text = hickerySong.title
            cell?.songTextView?.sizeToFit()
            cell?.songImageView?.URLString = hickerySong.photoURL
        }
        return cell!
    }
}
