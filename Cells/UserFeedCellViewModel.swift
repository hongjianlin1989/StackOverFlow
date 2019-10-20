//
//  UserFeedCellViewModel.swift
//  StackOverFlow
//
//  Created by hongjian lin on 10/19/19.
//  Copyright © 2019 com.hongjian. All rights reserved.
//

import UIKit

class UserFeedCellViewModel: NSObject {

    var userFeed: UserFeed!
    
    init(userFeed: UserFeed) {
        self.userFeed = userFeed
    }
    
    var nameString: String {
        return userFeed.display_name
    }
    
    var glodString: String {
        return "userFeed.glod".localize(String(userFeed.badge_counts.gold))
    }
    
    var silverString: String {
        return "userFeed.silver".localize(String(userFeed.badge_counts.silver))
    }
    
    var bronzeString: String {
        return "userFeed.bronze".localize(String(userFeed.badge_counts.bronze))
    }
    
    var imageUrlString: String {
           return userFeed.profile_image
       }
    
}
