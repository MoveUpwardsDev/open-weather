//
//  Forecast.swift
//  
//
//  Created by lgriffie on 17/06/2021.
//

import Foundation

public struct Forecast: Decodable {
    public let city: City
    public let list: [Hourly]
}

public struct Hourly: Decodable {
    public let dt: Date
    public let weather: [Weather]
    public let main: Condition
}
