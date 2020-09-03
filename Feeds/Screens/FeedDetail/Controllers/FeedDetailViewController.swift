//
//  FeedDetailViewController.swift
//  Feeds
//
//  Created by Siroson on 2020-09-02.
//  Copyright © 2020 Siroson. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {

    
    // MARK: - Properties -
    
    var post: Feed!
    
    // MARK: - Controls -
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        title = post.title
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
    }

}


// MARK: - Table view data source

extension FeedDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return post.isThumbnailAvailable ? 1 : 0
        } else {
            return post.isBodyAvailable ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedImageViewCell.identifier, for: indexPath) as! FeedImageViewCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.feedImageView.setImage(urlString: post.thumbnail)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedBodyDescriptionCell.identifier, for: indexPath) as! FeedBodyDescriptionCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.feedBodyLabel.font = .systemFont(ofSize: 14, weight: .medium)
            cell.feedBodyLabel.textColor = .primaryLabelColor
            cell.feedBodyLabel.text = post.body
            return cell
        }
    }
}


// MARK: - Table view delegate

extension FeedDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            let imageHeight: CGFloat = post.thumbnailHeight != nil ? CGFloat(post.thumbnailHeight!) : 0
            return imageHeight
        } else {
            let body = post.body ?? ""
            let bodyHeight = body.height(width: tableView.bounds.size.width - 50, font: .systemFont(ofSize: 14, weight: .medium))
            return bodyHeight + 20
        }
    }
}



class FeedImageViewCell: UITableViewCell {
    
    static let identifier = "FeedImageViewCell"
    
    @IBOutlet weak var feedImageView: ImageView!
    
}


class FeedBodyDescriptionCell: UITableViewCell {
    
    static let identifier = "FeedBodyDescriptionCell"
    
    @IBOutlet weak var feedBodyLabel: UILabel!
    
}
