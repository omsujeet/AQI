//
//  HomeInteractor.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

protocol HomeInteractorProtocol {
    func getAqiData()
}

class HomeInteractor: HomeInteractorProtocol {
    var responseHandler: IResponseHandler?
    var presenter: IResponseHandler?
    var homeUseCaseProvider = HomeScreenUseCaseProvider()
    
    func getAqiData() {
        if let responseHandler = presenter {
            let interfaceObj = homeUseCaseProvider.getAqiDataUseCase(handler: responseHandler)
            interfaceObj.getAqiData()
        }
    }
}
