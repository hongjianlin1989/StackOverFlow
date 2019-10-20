
import Foundation

enum RequestError: Error, Equatable {
    case notFound
    case noResponse
    case modelCreationFailure
    case undefined
    
    typealias StatusCode = Int
    typealias SpecificURLError = URLError
    typealias ModelName = String
    
    var customDescription: String {
        switch self {
            case .notFound: return "Endpoint not reachable or internet connection issues"
            case .noResponse: return "Request finished successfully but returned no response"
            case .modelCreationFailure: return "Creation of model object failed"
            case .undefined: return "No description available"
        }
    }
    
    var errorType: String {
        switch self {
            case .noResponse: return "Response Error"
            case .notFound: return "API Error"
            case .modelCreationFailure: return "Parse Error"
            case .undefined: return "Unknown Error"
        }
    }
    
    var statusCode: String {
        switch self {
            case .notFound: return "404"
            default: return "Not applicable"
        }
    }
    
    private var defaultErrorMessage: String {
        return self.localizedDescription
    }
    
    func getErrorData(requestData: RequestData, modelName: ModelName? = nil) ->(
        customErrorMessage: String,
        defaultErrorMessage: String,
        statusCode: String,
        endPoint: String,
        model: String
        ) {
            return (
                customErrorMessage: "\(self.errorType): \(self.customDescription)",
                defaultErrorMessage: self.defaultErrorMessage,
                statusCode: self.statusCode,
                endPoint: requestData.endpoint,
                model: modelName ?? "No Associated Model"
            )
    }
    
    func getErrorPrintOut(from requestData: RequestData, and modelName: ModelName? = nil) -> String {
        let errorData = self.getErrorData(requestData: requestData, modelName: modelName)
        let errorPrintOut = """
        
        Error Encountered
        ------------------------------------------------------
        Custom Error Message:  \(errorData.customErrorMessage)
        Default Error Message: \(errorData.defaultErrorMessage)
        Status Code Logged:    \(errorData.statusCode)
        Endpoint with Error:   \(errorData.endPoint)
        Model with Error:      \(errorData.model)
        ------------------------------------------------------
        
        """
        
        return errorPrintOut
    }
}
