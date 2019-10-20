
import Foundation
import PromiseKit
import Alamofire

protocol NetworkDispatcherProtocol {
    func dispatch(urlRequest: URLRequest) -> Promise<Data>
}

struct NetworkDispatcher: NetworkDispatcherProtocol {
    static let instance = NetworkDispatcher()
    private init() { }

    func dispatch(urlRequest: URLRequest) -> Promise<Data> {
        print(urlRequest.description)
        
        return Promise { seal in
            Alamofire.request(urlRequest)
                .validate()
                .responseJSON { (dataResponse) in
                    guard let httpResponse = dataResponse.response,
                        let data = dataResponse.data else {
                        return seal.reject(RequestError.noResponse)
                    }
                    switch httpResponse.statusCode {
                        case 200:
                            seal.fulfill(data)
                        case 404:
                            seal.reject(RequestError.notFound)
                        default:
                            seal.reject(RequestError.undefined)
                    }
            }
        }
    }

 
}
