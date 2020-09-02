//
//  FeedsListViewController.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit
import TinyConstraints

class FeedsListViewController: UIViewController {

    
    // MARK: - Properties -
    
    private var allFeeds = [Post]()
    
    
    // MARK: - Controls -
    
    private var collectionView: UICollectionView!
    
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        FeedsProvider.getAll { posts in
            self.allFeeds = posts
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
    }

}


// MARK: - UI setup functions -

extension FeedsListViewController {
    
    private func setupUI() {
        self.title = "Swift News"
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FeedBriefCollectionViewCell.self, forCellWithReuseIdentifier: FeedBriefCollectionViewCell.identifier)
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
    }
}


// MARK: - Collection view data source -

extension FeedsListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFeeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedBriefCollectionViewCell.identifier, for: indexPath) as! FeedBriefCollectionViewCell
        cell.backgroundColor = .backgroundColor
        cell.setupUI()
        
        let feed = allFeeds[indexPath.item]
        cell.titleLabel.text = feed.title
        
        if let thumbnail = feed.thumbnail, thumbnail.isUrl() {
            cell.thumbnailImage.setImage(urlString: thumbnail)
            cell.thumbnailImage.isHidden = false
        } else {
            cell.thumbnailImage.isHidden = true
        }
        
        return cell
    }
}

// MARK: - Collection view delegate -

extension FeedsListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = allFeeds[indexPath.item].title ?? ""
        let titleHeight = title.height(width: collectionView.bounds.size.width - 50, font: UIFont.systemFont(ofSize: 16, weight: .medium)) + 20
        return CGSize(width: collectionView.bounds.size.width, height: titleHeight)
    }
}
