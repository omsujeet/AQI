//
//  HomePresenter.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

protocol HomePresenterProtocol: IResponseHandler {
    
}

class HomePresenter: HomePresenterProtocol {
    var viewController: HomeController?
    var arrData = [Aqi]()
    
    func handleResponse<T>(response: APIResponse<T, APIError>) where T : Decodable {
        switch response {
        case .success(let responseData):
            if let aqiResponse: [Aqi] = responseData as? [Aqi] {
                self.processAqiResponse(response: aqiResponse)
            }
        case .error(let errorModel):
            print(errorModel)
        }
    }
    
    func processAqiResponse(response: [Aqi]) {
        print("In Presenter")
        if response.count > 0 {
            manageData(response: response)
            if (viewController?.isKind(of: HomeController.self))! {
                var arr = [CellRepresentable]()
                for data in self.arrData {
                    let model = AqiCellModel(withData: data)
                    arr.append(model)
                }
                (viewController as? HomeController)?.showAqiData(withResponse: arr)
            }
        }
    }
    
    func manageData(response: [Aqi]) {
        if arrData.count != 0 {
            for newItem in response {
                if let index = self.arrData.firstIndex(where: {$0.cityName == newItem.cityName}) {
                    if let aqi = newItem.aqiValue[0] {
                        self.arrData[index].aqiValue.append(aqi) 
                    }
                    self.arrData[index].time.append(Date())
                }
                else {
                    self.arrData.append(newItem)
                }
            }
        }
        else {
            self.arrData = response
        }
    }

}
