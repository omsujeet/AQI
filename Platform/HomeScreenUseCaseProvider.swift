//
//  HomeScreenUseCaseProvider.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

class HomeScreenUseCaseProvider: IHomeScreenUseCaseProvider {
    func getAqiDataUseCase(handler: IResponseHandler) -> IHomeScreenUseCase {
        return HomeScreenUseCase(handler: handler)
    }
}
