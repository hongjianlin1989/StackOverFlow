
import Foundation
import Alamofire

typealias ApiParams = [String: Any]

struct ApiRequest: URLRequestConvertible {
    let requestData: RequestData
    
    init (requestData: RequestData) {
        self.requestData = requestData
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try requestData.endpoint.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestData.method.rawValue
        urlRequest.timeoutInterval = kApiTimeOut
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let params = requestData.params {
            switch requestData.method {
                case .post, .put:
                    do {
                        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
                    } catch {
                        throw error
                    }
                case .get:
                    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
                    var queryItems = [URLQueryItem]()
                    
                    params.forEach {
                        queryItems.append(URLQueryItem(name: $0.key, value: $0.value as? String))
                    }
                    urlComponents?.queryItems = queryItems
                    urlRequest.url = urlComponents?.url
                default:
                    break
            }
        }
        return urlRequest
    }
}
