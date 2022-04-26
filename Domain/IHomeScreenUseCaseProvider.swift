//
//  IHomeScreenUseCaseProvider.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

protocol IHomeScreenUseCaseProvider {
    func getAqiDataUseCase(handler: IResponseHandler)-> IHomeScreenUseCase
}
