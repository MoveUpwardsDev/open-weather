//
//  Current+Api.swift
//  weather-app
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Combine
import WeatherApi

extension Current {
    @discardableResult
    public static func current(completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        ApiService.shared.get(action: "weather", parameters: ["q": "Paris", "units": "metric"], completion: completion)
    }
}

extension Current {
    public static var current: AnyPublisher<Self, Error> {
        Future<Self, Error> { promise in
            current { (result: Result<Self, AFError>) in
                promise(result.mapError({ $0 as Error }))
            }
        }.eraseToAnyPublisher()
    }
}
