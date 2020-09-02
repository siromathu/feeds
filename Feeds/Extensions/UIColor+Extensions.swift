//
//  UIColor+Extensions.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var backgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return UIColor.black
        }
    }
    
    static var secondaryBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemBackground
        } else {
            return UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
        }
    }
    
    static var tertiaryBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.tertiarySystemBackground
        } else {
            return UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        }
    }
    
    static var primaryLabelColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label
        } else {
            return UIColor.white
        }
    }
    
    static var secondaryLabelColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondaryLabel
        } else {
            return UIColor.systemGray
        }
    }
    
    static var tertiaryLabelColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.tertiaryLabel
        } else {
            return UIColor.systemGray
        }
    }
    
    static let blackColor = UIColor.black
    static let whiteColor = UIColor.white
    static let grayColor = UIColor.systemGray
    static let redColor = UIColor.systemRed
    static let blueColor = UIColor.systemBlue
    static let greenColor = UIColor.systemGreen
}
