//
//  ChartsPresenter.swift
//  AQI
//
//  Created by Sujeet on 27/04/22.
//

import Foundation
import Charts

protocol ChartsPresenterProtocol: AnyObject {
    func manageDataForChart(withData data: Aqi?)
}

class ChartsPresenter: ChartsPresenterProtocol {
    
    var viewController: ChartController?
    
    func manageDataForChart(withData data: Aqi?) {
        var val = [ChartDataEntry]()
        if let data = data {
            for i in 0..<data.time.count {
                if let aqiValue = data.aqiValue[i] {
                    val.append(ChartDataEntry(x: Double(i), y: aqiValue))
                }
            }
        }
        let set1 = LineChartDataSet(entries: val, label: "DataSet 1")
        viewController?.getChartData(forChart: set1)
    }
}
