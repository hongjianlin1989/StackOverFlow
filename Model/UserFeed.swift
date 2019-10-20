//
//  UserFeeds.swift
//  StackOverFlow
//
//  Created by hongjian lin on 10/18/19.
//  Copyright © 2019 com.hongjian. All rights reserved.
//
import Foundation

struct UserItems: Codable {
    let items: [UserFeed]
}


struct UserFeed: Codable {
    
    let display_name: String
    let badge_counts: Badge
    let profile_image: String

}

struct Badge: Codable  {
    let bronze: Int
    let silver: Int
    let gold: Int
}
