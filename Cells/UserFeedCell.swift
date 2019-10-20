//
//  UserFeedCell.swift
//  StackOverFlow
//
//  Created by hongjian lin on 10/19/19.
//  Copyright © 2019 com.hongjian. All rights reserved.
//

import UIKit

class UserFeedCell: UITableViewCell {

    @IBOutlet var imageIcon: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var goldLabel: UILabel!
    
    @IBOutlet var silverLabel: UILabel!
    
    @IBOutlet var bronzeLabel: UILabel!
    
    static let identifier = "UserFeedCell"
    let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    var viewModel: UserFeedCellViewModel! {
        didSet {
            nameLabel.text = viewModel.nameString
            goldLabel.text = viewModel.glodString
            silverLabel.text = viewModel.silverString
            bronzeLabel.text = viewModel.bronzeString
            activityView.startAnimating()
            imageIcon.imageFromUrl(urlString: viewModel.imageUrlString, completion:{ (success) in
                DispatchQueue.main.async {
                    self.activityView.stopAnimating()
                    }
              
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityView.center = self.imageIcon.center
        activityView.color = UIColor.white
        self.imageIcon.addSubview(activityView)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
