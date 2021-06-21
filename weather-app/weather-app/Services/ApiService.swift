//
//  ApiService.swift
//  weather-app
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Foundation
import WeatherApi

/// Responsible for requesting the Tibtop API
public final class ApiService: Client {
    public static let shared = ApiService()

    internal required override init() {
        super.init()

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        set(config: WeatherEnv(env: .production, decoder: decoder))
            .set(apiKey: "f5806e9805a0775e49c8545944a9f4ad")
    }
}

public final class WeatherEnv: Config {
    public override var baseURL: String {
        switch env {
        case .develop:
            return "http://localhost:8080/data/2.5"
        case .production:
            return "https://api.openweathermap.org/data/2.5"
        }
    }
}
