//
//  Config.swift
//  
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Foundation

open class Config: ConfigProtocol {
    open var headers: [HTTPHeader] { [.accept("application/json")] }

    open var baseURL: String { "http://localhost:8080" }

    open var configuration: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        if #available(iOS 11.0, *) { config.waitsForConnectivity = true }

        return config
    }

    public let env: ApiEnvironment

    public let decoder: DataDecoder

    public required init(env: ApiEnvironment, decoder: DataDecoder = JSONDecoder()) {
        self.env = env
        self.decoder = decoder
    }
}
