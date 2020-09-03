//
//  UIViewController+Extensions.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
