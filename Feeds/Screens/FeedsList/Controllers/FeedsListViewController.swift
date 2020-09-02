//
//  FeedsListViewController.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

class FeedsListViewController: UIViewController {

    
    // MARK: - Controls -
    
    private var collectionView: UICollectionView!
    
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}


// MARK: - UI setup functions -

extension FeedsListViewController {
    
    private func setupUI() {
        
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
    }
}
