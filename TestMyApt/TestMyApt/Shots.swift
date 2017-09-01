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
    
    // MARK: - init only For UnitTest
    init(fromArray array: Array<Any>, indexOfPlist:Int) {
        let objectData = try? JSONSerialization.data(withJSONObject: array, options: JSONSerialization.WritingOptions(rawValue: 0))
        let json:JSON = JSON(objectData!)
        self.id = json[indexOfPlist]["id"].stringValue
        self.title = json[indexOfPlist]["title"].stringValue
        self.desc = json[indexOfPlist]["description"].stringValue
        self.viewsCount = json[indexOfPlist]["views_count"].stringValue
        self.createdAt = json[indexOfPlist]["created_at"].stringValue
        self.image = json[indexOfPlist]["images"]["normal"].stringValue
        self.commentsCount = json[indexOfPlist]["comments_count"].stringValue
    }
}
