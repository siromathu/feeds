//
//  AppDelegate.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    // MARK: - Properties -
    
    static let shared = UIApplication.shared.delegate as! AppDelegate
    
    
    // MARK: - Controls -
    
    var window: UIWindow?
    
    
    // MARK: - Lifecycle -

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

