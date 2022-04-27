//
//  ChartsInteractor.swift
//  AQI
//
//  Created by Sujeet on 27/04/22.
//

import Foundation

protocol ChartsInteractorProtocol: AnyObject {
    func manageDataForChart(withData data: Aqi)
}

class ChartsInteractor: ChartsInteractorProtocol {
    
    var responseHandler: ChartsPresenterProtocol?
    var presenter: ChartsPresenterProtocol?
    
    func manageDataForChart(withData data: Aqi) {
        
    }
    
}
