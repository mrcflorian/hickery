//
//  HickerySongCell.swift
//  Hickery
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//
import NucleusFramework

let kSongImageCornerRadius: CGFloat = 4.0

class HickerySongCell: UITableViewCell
{
    @IBOutlet var songImageView: NLFDownloadableImageView!
    @IBOutlet var songTextView: UITextView!

    init(reuseIdentifier: String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib()
    {
        self.songImageView?.clipsToBounds = true
        self.songImageView?.layer.cornerRadius = kSongImageCornerRadius
    }
}
