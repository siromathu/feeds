//
//  FeedBriefCollectionViewCell.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit
import TinyConstraints

class FeedBriefCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties -
    
    static let identifier = "FeedBriefCollectionViewCell"
    
    // MARK: - Controls -
    
    var containerView: UIView!
    
    var titleLabel: UILabel!
    
    var thumbnailImage: ImageView!
    
    // MARK: - UI setup functions -
    
    func setupUI() {
        if containerView == nil {
            containerView = UIView()
            contentView.addSubview(containerView)
            containerView.edgesToSuperview(insets: TinyEdgeInsets(top: 5, left: 16, bottom: 5, right: 16))
        }
        
        if thumbnailImage == nil {
            thumbnailImage = ImageView()
            thumbnailImage.contentMode = .scaleAspectFit
            containerView.addSubview(thumbnailImage)
            thumbnailImage.edgesToSuperview()
        }
        
        if titleLabel == nil {
            titleLabel = UILabel()
            titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            titleLabel.textColor = .primaryLabelColor
            titleLabel.numberOfLines = 0
            titleLabel.lineBreakMode = .byWordWrapping
            containerView.addSubview(titleLabel)
            titleLabel.edgesToSuperview()
        }
    }
}
