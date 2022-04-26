//
//  HomeConfigurator.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

class HomeConfigurator {
    var interactor: HomeInteractor?
    var presenter: HomePresenter?
    var router: HomeRouter?
    func build(viewController: HomeController) {
        interactor = HomeInteractor()
        presenter = HomePresenter()
        router = HomeRouter()
        router?.viewController = viewController
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
