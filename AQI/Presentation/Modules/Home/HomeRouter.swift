//
//  HomeRouter.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

protocol HomeRouterProtocol {
    func showDataOnChart(with data: Aqi)
}

class HomeRouter: HomeRouterProtocol {
    var viewController: HomeController?
    
    func showDataOnChart(with data: Aqi) {
        if let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "ChartController") as? ChartController {
            vc.aqiData = data
            viewController?.present(vc, animated: true, completion: nil)
        }
    }
    
    
}
