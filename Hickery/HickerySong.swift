//
//  HickerySong.swift
//  Hickery
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

class HickerySong: NSObject
{
    var songID: String
    var photoURL: String
    var title: String
    var content: String
    var categoryID: String
    var subcategoryID: String

    init(jsonDictionary: NSDictionary)
    {
        songID = jsonDictionary["hkid"] as String
        photoURL = jsonDictionary["photo"] as String
        title = jsonDictionary["title"] as String
        content = jsonDictionary["content"] as String
        categoryID = jsonDictionary["category_id"] as String
        subcategoryID = jsonDictionary["subcategory_id"] as String
    }
}
