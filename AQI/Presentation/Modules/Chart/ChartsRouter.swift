//
//  ChartsRouter.swift
//  AQI
//
//  Created by Sujeet on 27/04/22.
//

import UIKit

protocol ChartsRouterProtocol: AnyObject {
    func dismisVc()
}

class ChartsRouter: ChartsRouterProtocol {
    var viewController: ChartController?
    func dismisVc() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
