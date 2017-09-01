//
//  Shots.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import SwiftyJSON

public class Shots: NSObject {
    
    var id: String?
    var title: String?
    var desc: String?
    var viewsCount: String?
    var createdAt: String?
    var image: String?
    var commentsCount: String?
    
    init(fromJSON json: JSON) {
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.desc = json["description"].stringValue
        self.viewsCount = json["views_count"].stringValue
        self.createdAt = json["created_at"].stringValue
        self.image = json["images"]["normal"].stringValue
        self.commentsCount = json["comments_count"].stringValue
    }
}
