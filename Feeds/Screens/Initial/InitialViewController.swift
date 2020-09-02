//
//  InitialViewController.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}


// MARK: - UI setup functions -

extension InitialViewController {
    
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        setupLogoImageView()
        setupBaseViewController()
    }
    
    private func setupLogoImageView() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemRed
        view.addSubview(imageView)
        imageView.centerInSuperview()
        imageView.width(150)
        imageView.height(150)
    }
    
    private func setupBaseViewController() {
        let controller = FeedsListViewController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async { self.present(nav, animated: true, completion: nil) }
    }
    
}
