//
//  AqiModel.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

struct Aqi: Codable {
    let cityName: String?
    var aqiValue: [Double?]
    var time: [Date]
    
    enum CodingKeys: String, CodingKey {
       case cityName = "city"
        case aqiValue = "aqi"
   }
    
    public init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.cityName = try map.decodeIfPresent(String.self, forKey: .cityName)
        if let num = try map.decodeIfPresent(Double.self, forKey: .aqiValue) {
            self.aqiValue = [round(num * 100) / 100.0]
        }
        else {
            self.aqiValue = [0.0]
        }
        self.time = [Date()]
    }
}

