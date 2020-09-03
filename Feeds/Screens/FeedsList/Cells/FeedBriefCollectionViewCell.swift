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
    
    var contentStack: UIStackView!
    
    var titleLabel: UILabel!
    
    var thumbnailImage: ImageView!
    
}


// MARK: - UI setup functions -

extension FeedBriefCollectionViewCell {
    
    func setupUI() {
        setupContainerView()
        setupContentStack()
        setupTitleLabel()
        setupThumbnailImageView()
    }
    
    private func setupContainerView() {
        guard containerView == nil else { return }
        containerView = UIView()
        containerView.backgroundColor = .tertiaryBackgroundColor
        containerView.layer.cornerRadius = 8
        contentView.addSubview(containerView)
        containerView.edgesToSuperview(insets: TinyEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    private func setupContentStack() {
        guard contentStack == nil else { return }
        contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.spacing = 8
        containerView.addSubview(contentStack)
        contentStack.edgesToSuperview(insets: TinyEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    private func setupTitleLabel() {
        guard titleLabel == nil else { return }
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .primaryLabelColor
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        contentStack.addArrangedSubview(titleLabel)
    }
    
    private func setupThumbnailImageView() {
        guard thumbnailImage == nil else { return }
        thumbnailImage = ImageView()
        thumbnailImage.contentMode = .center
        thumbnailImage.clipsToBounds = true
        contentStack.addArrangedSubview(thumbnailImage)
    }
}
