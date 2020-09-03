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
    
    private var allFeeds = [Feed]()
    
    
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
        title = "Swift News"
        view.backgroundColor = .backgroundColor
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
        cell.backgroundColor = .clear
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
        let feed = allFeeds[indexPath.item]
        let title = feed.title ?? ""
        let titleHeight = title.height(width: collectionView.bounds.size.width, font: .systemFont(ofSize: 14, weight: .medium))
        let imageHeight: CGFloat = feed.thumbnailHeight != nil ? CGFloat(feed.thumbnailHeight!) : 0
        return CGSize(width: collectionView.bounds.size.width, height: titleHeight + imageHeight + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if #available(iOS 13.0, *) {
            let controller = storyboard.instantiateViewController(identifier: "FeedDetailViewController") as! FeedDetailViewController
            controller.post = allFeeds[indexPath.item]
            DispatchQueue.main.async { self.navigationController?.pushViewController(controller, animated: true) }
        } else {
            let controller = storyboard.instantiateViewController(withIdentifier: "FeedDetailViewController") as! FeedDetailViewController
            controller.post = allFeeds[indexPath.item]
            DispatchQueue.main.async { self.navigationController?.pushViewController(controller, animated: true) }
        }
        
    }
}
