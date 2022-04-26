//
//  AqiModel.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

public enum APIResponse<T, U> {
    case success(value: T)
    case error(error: U)
}
