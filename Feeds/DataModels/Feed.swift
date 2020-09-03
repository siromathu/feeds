//
//  Post.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit
import ObjectMapper

struct Feed: Mappable {
    
    var title: String?
    
    var body: String?
    
    var thumbnail: String?
    
    var thumbnailWidth: Double?
    
    var thumbnailHeight: Double?
    
    var isThumbnailAvailable: Bool {
        return thumbnail?.isUrl() ?? false
    }
    
    var isBodyAvailable: Bool {
        return body != nil && !body!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        title         <- map["data.title"]
        body  <- map["data.selftext"]
        thumbnail  <- map["data.thumbnail"]
        thumbnailWidth <- map["data.thumbnail_width"]
        thumbnailHeight <- map["data.thumbnail_height"]
    }
    
}
