//
//  City.swift
//  WeatherModel
//
//  Created by lgriffie on 16/06/2021.
//

import Foundation

public struct City: Decodable {
    public let id: Int
    public let name: String
    public let country: String
    public let timezone: Int

    public let coord: Coordinate

}
