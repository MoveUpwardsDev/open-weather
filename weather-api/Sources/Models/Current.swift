//
//  File.swift
//  
//
//  Created by lgriffie on 17/06/2021.
//

import Foundation

public struct Current: Decodable {
    public let id: Int
    public let name: String
    public let main: Condition
    public let coord: Coordinate
    public let weather: [Weather]
}
