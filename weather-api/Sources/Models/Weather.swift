//
//  Weather.swift
//  WeatherModel
//
//  Created by lgriffie on 16/06/2021.
//

import Alamofire
import Foundation

public struct Weather: Decodable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String

    public func icon(completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request("https://openweathermap.org/img/wn/\(icon)@2x.png",method: .get)
            .response { response in
                switch response.result {
                case .success(let responseData): completion(.success(responseData))
                case .failure(let error): completion(.failure(error))
                }
            }
    }
}
