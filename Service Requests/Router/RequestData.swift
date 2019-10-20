
import Foundation
import Alamofire

protocol RequestData {
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var params: ApiParams? { get }
    var decodingStrategy: JSONDecoder.DateDecodingStrategy { get }
}

class RequestInformation: RequestData {
    private(set) var endpoint: String
    private(set) var method: HTTPMethod
    private(set) var params: ApiParams?
    private(set) var decodingStrategy: JSONDecoder.DateDecodingStrategy
    
    init(endpoint: String,
         method: HTTPMethod = .get,
         params: ApiParams? = nil,
         decodingStrategy: JSONDecoder.DateDecodingStrategy? = nil) {
        self.endpoint = endpoint
        self.method = method
        self.params = params
        self.decodingStrategy = decodingStrategy ?? JSONDecoder().dateDecodingStrategy
    }
}
