//
//  UserFeedCell.swift
//  StackOverFlow
//
//  Created by hongjian lin on 10/19/19.
//  Copyright © 2019 com.hongjian. All rights reserved.
//

import UIKit

class UserFeedCell: UITableViewCell {

    @IBOutlet var ImageIcon: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var goldLabel: UILabel!
    
    @IBOutlet var silverLabel: UILabel!
    
    @IBOutlet var bronzeLabel: UILabel!
    
    static let identifier = "UserFeedCell"
    
    var viewModel: UserFeedCellViewModel! {
        didSet {
            nameLabel.text = viewModel.nameString
            goldLabel.text = viewModel.glodString
            silverLabel.text = viewModel.silverString
            bronzeLabel.text = viewModel.bronzeString
            ImageIcon.imageFromUrl(urlString: viewModel.imageUrlString)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
