//
//  HomeScreenUseCase.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

class HomeScreenUseCase: IHomeScreenUseCase {
    var responseHandler: IResponseHandler
     
    public init(handler: IResponseHandler) {
         self.responseHandler = handler
     }
    
    func getAqiData() {
        NetworkCaller.shared.createWebSocketTask()
        NetworkCaller.shared.response = {  (res) in
//            print("From Use Case = \(res)" ?? "No Response")
            if res != "No Response" {
                let data = res?.data(using: .utf8)
                let decoder = JSONDecoder()
                if let resData = data {
                    if let responseObj = try? decoder.decode([Aqi].self, from: resData) {
//                    print("From Use Case = \(responseObj!)")
                        let obj = APIResponse<[Aqi], APIError>.success(value: responseObj)
                        self.responseHandler.handleResponse(response: obj)
                    }
                }
            }
        }
    }
}
