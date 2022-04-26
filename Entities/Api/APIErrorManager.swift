//
//  AqiModel.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

public struct APIErrorManager {
    
    /// This method is used to create custom error which contains error code, error message, and title
    ///
    ///     ErrorManager.processError(error: error)
    ///     or
    ///     ErrorManager.processError(errorCode: 10, errorMsg: "Msg String")
    ///
    /// - parameter error:    If we have error object then we can pass this in method. we need not to pass remaining parameters.
    /// - parameter errorCode: It accept custom error code.
    /// - parameter errorMsg: Indicates error message.
    /// - parameter responseStatus: Response status object for custom errors.
    /// - returns: Returns Custom error model object which contains error code, error message and alert title
    
   public static func processError(error: Error? = nil, errorCode: Int? = nil, errorMsg: String? = nil) -> APIError {
        var errorModel: APIError!
        
        if let err = error {
            errorModel = APIError.error(error: err)
            
        } else {
            if let code = errorCode {
                errorModel = APIError.error(errorCode: code, errorMessage: errorMsg, errorModel: error)
                
            } else {
                errorModel = APIError.error(errorCode: 1001, errorMessage: "something went wrong", errorModel: error)
            }
        }
        
        return errorModel
    }
}
