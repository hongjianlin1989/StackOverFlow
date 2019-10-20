import Foundation

struct CreateStackOverFlowUserRouter: ApiRouter {

    typealias Model = UserItems
    var requestData: RequestData
    init(endpoint: String) {
        requestData = RequestInformation(endpoint: endpoint)
    }
}
