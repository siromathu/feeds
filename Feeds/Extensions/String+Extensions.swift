//
//  String+Extensions.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        l.font = font
        l.text = self
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.sizeToFit()
        return l.frame.size.height
    }
    
    func isUrl() -> Bool {
        if let url = URL(string: self),
            let scheme = url.scheme,
            ["http", "https"].contains(scheme) {
            return true
        }
        
        return false
    }
}
