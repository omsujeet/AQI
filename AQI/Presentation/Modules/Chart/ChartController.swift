//
//  ChartController.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import UIKit
import Charts

protocol ChartControllerProtocol: AnyObject {
    func getChartData(forChart set1: LineChartDataSet)
}

class ChartController: UIViewController, ChartControllerProtocol {
    
    @IBOutlet var chartView: LineChartView!
    
    @IBOutlet weak var lblCityName: UILabel!
    var aqiData: Aqi?
    var interactor: ChartsInteractorProtocol?
    var router: ChartsRouterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        setUpChart()
        if let data = aqiData {
            lblCityName.text = data.cityName
            interactor?.manageDataForChart(withData: data)
//            self.setDataCount(data.time.count, range: 700)
        }
    }
    
    private func setUp() {
        let configurator = ChartsConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
    }
    
    private func setUpChart() {
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
    }

    private func setup(_ dataSet: LineChartDataSet) {
        dataSet.lineDashLengths = nil
        dataSet.highlightLineDashLengths = nil
        dataSet.setColors(.black, .red, .white)
        dataSet.setCircleColor(.black)
//        dataSet.gradientPositions = [0, 40, 100]
        dataSet.lineWidth = 1
        dataSet.circleRadius = 3
        dataSet.drawCircleHoleEnabled = false
        dataSet.valueFont = .systemFont(ofSize: 9)
        dataSet.formLineDashLengths = nil
        dataSet.formLineWidth = 1
        dataSet.formSize = 15
    }
    
    @IBAction func btnCloseClicked(_ sender: Any) {
        router?.dismisVc()
    }
    
}

extension ChartController {
    func getChartData(forChart set1: LineChartDataSet) {
        set1.drawIconsEnabled = false
        setup(set1)

        let value = ChartDataEntry(x: Double(3), y: 3)
        set1.addEntryOrdered(value)
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

        set1.fillAlpha = 1
//        set1.fill = LinearGradientFill(gradient: gradient, angle: 90)
        set1.drawFilledEnabled = true

        let data = LineChartData(dataSet: set1)

        chartView.data = data
    }
}
