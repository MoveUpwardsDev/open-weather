//
//  Client.swift
//  
//
//  Created by lgriffie on 21/06/2021.
//

import Alamofire
import Foundation

open class Client: RequestInterceptor {

    // MARK: - Private properties

    public private(set) var config: ConfigProtocol = Config(env: .production)
    public private(set) var apiKey: String?

    // MARK: Public functions

    public init() { }

    public var baseUrl: String {
        config.baseURL
    }

    @discardableResult
    public func set(config: ConfigProtocol) -> Self {
        self.config = config

        return self
    }

    @discardableResult
    public func set(apiKey: String) -> Self {
        self.apiKey = apiKey

        return self
    }

    open lazy var manager: Session = {
        Session(configuration: config.configuration, interceptor: self, redirectHandler: redirectionHandler)
    }()

    open func adapt(_ urlRequest: URLRequest,
                    for session: Session,
                    completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest

        if let key = apiKey, let url = urlRequest.url {
            var components = URLComponents(string: url.absoluteString)
            components?.queryItems?.append(URLQueryItem(name: "appid", value: key))
            urlRequest.url = components?.url
        }

        config.headers.forEach { urlRequest.headers.add($0) }

        completion(.success(urlRequest))
    }

    open var redirectionHandler: Redirector {
        Redirector(behavior: .follow)
    }

    private func request<T: Decodable, U: Encodable>(for action: String,
                                                     method: HTTPMethod,
                                                     parameters: U? = nil,
                                                     encoder: ParameterEncoder,
                                                     completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest? {
        do {
            var req = URLRequest(url: try "\(config.baseURL)/\(action)".asURL())
            req.method = method
            req = try encoder.encode(parameters, into: req)
            return execute(request: req, completion: completion)
        } catch let error {
            completion(.failure(error.asAFError(orFailWith: "unknown")))
        }

        return nil
    }

    @discardableResult
    open func execute<T: Decodable>(request: URLRequestConvertible,
                                    completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        manager.request(request)
            .validate()
            .responseDecodable(of: T.self, decoder: config.decoder) { response in
                completion(response.result)
        }
    }

    @discardableResult
    public func get<T: Decodable>(action: String,
                                  parameters: [String: String]? = nil,
                                  encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
                                  completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest? {
        request(for: action, method: .get, parameters: parameters, encoder: encoder, completion: completion)
    }
}
