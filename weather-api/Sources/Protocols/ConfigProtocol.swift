//
//  ConfigProtocol.swift
//  
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Foundation

public protocol ConfigProtocol {
    var headers: [HTTPHeader] { get }
    var baseURL: String { get }
    var env: ApiEnvironment { get }
    var decoder: DataDecoder { get }
    var configuration: URLSessionConfiguration { get }

    init(env: ApiEnvironment, decoder: DataDecoder)
}
