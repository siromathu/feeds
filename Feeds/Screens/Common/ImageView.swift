//
//  ImageView.swift
//  tvtailpro
//
//  Created by Siroson on 27/05/20.
//  Copyright © 2020 TV Tail. All rights reserved.
//

import UIKit
import SDWebImage

class ImageView: UIImageView {
    
    // MARK: - Controls -
    
    private let errorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        let image = #imageLiteral(resourceName: "no_image").withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = UIColor.grayColor
        return imageView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            view.style = .large
        } else {
            view.style = .whiteLarge
        }
        view.tintColor = UIColor.grayColor
        return view
    }()
    
    
    // MARK: - Initializers -
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.setupUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
}


// MARK: - Helper functions -

extension ImageView {
    
    private func setupUI() {
        self.addSubview(errorImage)
        self.errorImage.centerInSuperview()
        self.errorImage.width(35)
        self.errorImage.height(35)
        
        self.addSubview(activityIndicator)
        self.activityIndicator.centerInSuperview()
    }
    
    func setImage(urlString: String?, notificationId: String? = nil, channelId: Int? = nil,
                  options: SDWebImageOptions = [], completed completedBlock: SDExternalCompletionBlock? = nil) {
        
        guard let unwrappedUrlString = urlString, let url = URL(string: unwrappedUrlString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) else {
            DispatchQueue.main.async {
                self.image = nil
                self.errorImage.isHidden = false
            }
            return
        }
        
        // Set indicator
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
        
        // Fetch image
        self.sd_setImage(with: url) { image, error, cacheType, url in
            if completedBlock != nil {
                completedBlock?(image, error, cacheType, url)
                DispatchQueue.main.async {
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                }
                
            } else {
                if let error = error {
                    debugPrint(error.localizedDescription)
                    
                    // Show no image icon
                    DispatchQueue.main.async {
                        self.image = nil
                        self.errorImage.isHidden = false
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.image = image
                        self.errorImage.isHidden = true
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                    }
                }
            }
        }
    }
    
    func showErrorImage() {
        DispatchQueue.main.async { self.errorImage.isHidden = false }
    }
    
    func hideErrorImage() {
        DispatchQueue.main.async { self.errorImage.isHidden = true }
    }
}
