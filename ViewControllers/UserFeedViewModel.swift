//
//  UserFeedViewModel.swift
//  StackOverFlow
//
//  Created by hongjian lin on 10/19/19.
//  Copyright © 2019 com.hongjian. All rights reserved.
//

import UIKit

protocol ViewModelDataSourceDelegate: AnyObject {
    func dataSourceDidFinishingLoading()
    func dataSourceDidLoadingWithError(error: RequestError?)
    func dataSourceDidStartLoading()
}


class UserFeedViewModel: NSObject {
    
    var userItems: UserItems?
    var dataSource: UserFeedDataSource
    weak var delegate: ViewModelDataSourceDelegate?
    
    
    override init() {
        self.dataSource = UserFeedDataSource()
    }
    
    func loadData() {
          dataSource.loadData(completion: { (success, error) in
              if success {
                  self.userItems = self.dataSource.userItems
                  self.delegate?.dataSourceDidFinishingLoading()
              } else {
                  self.delegate?.dataSourceDidLoadingWithError(error: error)
              }
          })
      }
    
    func viewModelForCell(index: IndexPath) -> UserFeedCellViewModel? {
        if let userFeed = userItems?.items[index.row] {
            return UserFeedCellViewModel(userFeed: userFeed)
        }
        return nil
    }
       
    //tableview delegate
    var numberOfSections: Int {
        return 1
    }
       
    func numberOfRows(section: Int) -> Int {
        return userItems?.items.count ?? 0
    }
       
   
}
