//
//  HomeController.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import UIKit

protocol HomeControllerProtocol: AnyObject {
    func showAqiData(withResponse data : [CellRepresentable])
}

class HomeController: UIViewController, HomeControllerProtocol {
    
    @IBOutlet weak var tableView: AqiTableView!
    
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Up VIPER 
        setUp()
        getAqiData()
        tableView.rowSelectedAt = { [weak self] (indexPath) in
            if let row = indexPath?.row {
                
                if let aqiData = (self?.tableView.arrData?[row] as? AqiCellModel)?.data {
                    self?.router?.showDataOnChart(with: aqiData)
                }
            }
        }
    }
    
    private func setUp() {
        let configurator = HomeConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
    }
    
    private func getAqiData() {
        interactor?.getAqiData()
    }
    
    
}

extension HomeController {
    func showAqiData(withResponse data: [CellRepresentable]) {
        DispatchQueue.main.async {            self.tableView.arrData = data
            self.tableView.reloadData()
        }
        
    }
    
}
