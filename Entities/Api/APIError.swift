//
//  AqiModel.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

private let requestTimeoutError = "Please try again."
private let noInternet = "No internet."

public struct APIError: Codable {

    public var code: Int  = -987
    public var message: String = "Something went wrong"
    
    init(error: Error?, errorMessage: String) {
        self.message = errorMessage
    }
    
    init(errorCode: Int, errMessage: String?, errorModel: Error?) {
        self.code = errorCode
        if let msg = errMessage {
            self.message = msg
        }
    }
    
    /// This method take error code and error message as argument and return object of error model class which contains error code, error message and error title
    ///
    /// - Parameters:
    ///   - errorCode: custom error code
    ///   - errorMessage: custom error message
    ///   - responseErrorModel: an error model object which is subclass of `ResponseStatus` class.
    /// - Returns: ErrorModel object
    static func error(errorCode: Int, errorMessage: String? = nil, errorModel: Error? = nil) -> APIError {
        // For all errors from server
        return APIError(errorCode: errorCode, errMessage: errorMessage, errorModel: errorModel)
    }
    
    /// This method takes Error type as argument and convert it into ErrorModel object
    ///
    /// - parameter error: Error type variable
    ///
    /// - returns: ErrorModel object
    static func error(error: Error) -> APIError {
        let code = error._code
        let message = getErrorMessage(error: error)
        return APIError(errorCode: code, errMessage: message, errorModel: nil)
    }

    /// Create an error model object from response status object
    ///
    /// - Parameter responseStatus: response error model.
    /// - Returns: Error Model object
    
    static func error(errorModel: Error) -> APIError {
        return APIError(errorCode: errorModel._code, errMessage: errorModel.localizedDescription, errorModel: errorModel)
    }
    
    /// This method returns error message based on error code
    ///
    /// - parameter error: Error type variable
    ///
    /// - returns: error message as String type
    
    private static func getErrorMessage(error: Error) -> String {
        var message = ""
        switch error._code {
        // For Request Timed Out, Network Connection lost and cannot connect to host
        case NSURLErrorTimedOut, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost, NSURLErrorCannotFindHost:
            message = requestTimeoutError + " (Code: \(error._code))"
        // For No Internet connection
        case NSURLErrorNotConnectedToInternet:
            message = noInternet
        default:
            // message = Constants.ApiErrorMessage.unknownError
            message = error.localizedDescription + "(Code: \(error._code))"
        }
        return message
    }
}
