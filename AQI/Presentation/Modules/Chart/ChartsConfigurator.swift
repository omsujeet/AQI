//
//  ChartsConfigurator.swift
//  AQI
//
//  Created by Sujeet on 27/04/22.
//

import Foundation

class ChartsConfigurator {
    var interactor: ChartsInteractor?
    var presenter: ChartsPresenter?
    var router: ChartsRouter?
    func build(viewController: ChartController) {
        interactor = ChartsInteractor()
        presenter = ChartsPresenter()
        router = ChartsRouter()
        interactor?.presenter = presenter
        presenter?.viewController = viewController
        router?.viewController = viewController
    }
}
