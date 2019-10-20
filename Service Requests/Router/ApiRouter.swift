
import Foundation
import PromiseKit

protocol ApiRouter {
    associatedtype Model: Codable
    var requestData: RequestData { get set }
}

extension ApiRouter {
    private func serialize(data: Data) -> Data {
        do {
            try JSONSerialization.jsonObject(with: data, options: [])
            return data
        } catch {
            return Data("{}".utf8)
        }
    }
    
    var apiRequest: ApiRequest {
        return ApiRequest(requestData: requestData)
    }
    
    var jsonDecoder: JSONDecoder {
        get {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = requestData.decodingStrategy
            return jsonDecoder
        }
    }
    
    func execute () -> Promise<Model> {
        let dispatcher = NetworkDispatcher.instance
        return Promise { seal in
            firstly { () -> Promise<Data> in
                let urlRequest = try apiRequest.asURLRequest()
                return dispatcher.dispatch(urlRequest: urlRequest)
                }.compactMap { data -> Self.Model in
                    do {
                        let jsonData = self.serialize(data: data)
                        return try self.jsonDecoder.decode(Model.self, from: jsonData)
                    } catch _ {
                        throw RequestError.modelCreationFailure
                    }
                }.done { model in
                    seal.fulfill(model)
                }.catch { error in
                    guard let _error = error as? RequestError else {
                        return seal.reject(RequestError.undefined)
                    }
                    print(_error.getErrorPrintOut(from: self.requestData,and: String(describing: Model.self)))
                    seal.reject(error)
            }
        }
    }
}
