//
//  Weather+Api.swift
//  weather-app
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Combine
import Foundation
import WeatherApi

extension Weather {
    public var icon: AnyPublisher<Data?, Error> {
        Future<Data?, Error> { promise in
            icon { (result: Result<Data?, AFError>) in
                promise(result.mapError({ $0 as Error }))
            }
        }.eraseToAnyPublisher()
    }
}
