//
//  IResponseHandler.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import Foundation

import Foundation
public protocol IResponseHandler {
    func handleResponse<T: Decodable>(response: APIResponse<T, APIError>)
}
