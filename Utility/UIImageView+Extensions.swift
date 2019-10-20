//
//  UIImageView+Extensions.swift
//  StackOverFlow
//
//  Created by hongjian lin on 10/19/19.
//  Copyright © 2019 com.hongjian. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func imageFromUrl(urlString: String) {
        
        if let data = UserDefaults.standard.value(forKey: urlString) as? Data, let image = UIImage(data: data) {
            self.image = image
            return
        }
        
        if let url = URL(string: urlString) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    
                    UserDefaults.standard.set(data, forKey: urlString)
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }

}
