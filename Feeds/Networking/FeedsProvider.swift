//
//  SessionManager.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FeedsProvider {
    
    class func getAll(_ completion: @escaping (([Post]) -> Void)) {
        let urlString = "https://www.reddit.com/r/swift/.json"
        AF.request(urlString).responseJSON { response in
            if let value = response.value {
                let json = JSON(value)
                let children = json["data"]["children"].arrayValue
                
                var posts = [Post]()
                for child in children {
                    var newPost = Post()
                    newPost.title = child["data"]["title"].string
                    newPost.thumbnail = child["data"]["thumbnail"].string
                    newPost.thumbnailWidth = child["data"]["thumbnail_width"].double
                    newPost.thumbnailHeight = child["data"]["thumbnail_height"].double
                    posts.append(newPost)
                }
                
                debugPrint(posts.count)
                completion(posts)
            }
        }
    }
}
