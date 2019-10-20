
import UIKit
import PromiseKit

class UserFeedDataSource: NSObject {
    var userItems: UserItems?
    
    func loadData(completion: @escaping ((_ success: Bool, _ error: RequestError?) -> Void)) {
        
        let endPoint = kHomePageURLString + "users?site=stackoverflow"
    
        CreateStackOverFlowUserRouter(endpoint: endPoint).execute()
           .done {
               self.userItems = $0
                completion(true, nil)
            }.catch {
                print($0)
                completion(false, $0 as? RequestError)
            }
    }
    
}
