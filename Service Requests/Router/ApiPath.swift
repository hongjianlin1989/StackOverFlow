import Foundation

enum ApiPath {
    case userItems(site)
    
    func path() -> String {
        switch self {
    
            case .userItems(let site):     return "users?site=\(site)"

        }
        
    }
    typealias site = String
}
