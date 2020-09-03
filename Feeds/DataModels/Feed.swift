//
//  Post.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

struct Feed: Codable {
    
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
    
    var getBody: String? {
        return body ?? title
    }
    
    init() { }
}
