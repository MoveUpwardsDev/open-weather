//
//  Forecast+Api.swift
//  weather-app
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Combine
import WeatherApi

extension Forecast {
    @discardableResult
    public static func forecast(completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        ApiService.shared.get(
            action: "forecast",
            parameters: ["q": "Paris", "units": "metric", "cnt": "5"],
            completion: completion
        )
    }
}

extension Forecast {
    public static var forecast: AnyPublisher<Self, Error> {
        Future<Self, Error> { promise in
            forecast { (result: Result<Self, AFError>) in
                promise(result.mapError({ $0 as Error }))
            }
        }.eraseToAnyPublisher()
    }
}
