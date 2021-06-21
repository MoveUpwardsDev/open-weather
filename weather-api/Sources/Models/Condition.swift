//
//  Condition.swift
//  WeatherModel
//
//  Created by lgriffie on 16/06/2021.
//

import Foundation

public struct Condition: Decodable {
    public let temp: Float
    public let feelsLike: Float
    public let tempMin: Float
    public let tempMax: Float
    public let pressure: Int
    public let humidity: Float
}
