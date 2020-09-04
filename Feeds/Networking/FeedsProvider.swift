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
    
    typealias FeedsCompletion = (([Feed]) -> Void)
    typealias FeedsFailure = ((String?) -> Void)
    
    class func getAll(_ completion: @escaping FeedsCompletion, _ failure: @escaping FeedsFailure) {
        let urlString = "https://www.reddit.com/r/swift/.json"
        AF.request(urlString).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                // to get JSON return value
                guard let responseJSON = response.value as? [String: Any],
                    let data = responseJSON["data"] as? [String: Any],
                    let children = data["children"] as? [[String: Any]] else {
                    failure("Invalid JSON response")
                    return
                }
                
                let feeds = Mapper<Feed>().mapArray(JSONArray: children)
                completion(feeds)
                
            case .failure(let error):
                failure(error.localizedDescription)
                break
            }
        }
    }
}
