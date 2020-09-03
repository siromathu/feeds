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
import ObjectMapper

class FeedsProvider {
    
    typealias Completion = (([Feed]) -> Void)
    
    typealias Failure = ((Error) -> Void)
    
    class func getAll(_ completion: @escaping Completion, _ failure: @escaping Failure) {
        let urlString = "https://www.reddit.com/r/swift/.json"
        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .success:
                //to get JSON return value
                guard let responseJSON = response.value as? [String: Any] else {
                    return
                }
                
                guard let data = responseJSON["data"] as? [String: Any],
                    let children = data["children"] as? [[String: Any]] else {
                    return
                }
                
                let feeds = Mapper<Feed>().mapArray(JSONArray: children)
//                debugPrint(feeds.map({ $0.title }))
                completion(feeds)
                
            case .failure(let error):
//                failure(0,"Error \(error)")
                break
            }
        }
    }
}
