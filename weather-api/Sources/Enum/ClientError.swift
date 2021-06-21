//
//  ClientError.swift
//
//
//  Created by lgriffie on 21/06/2021.
//

import Foundation

/// Client error
public enum ClientError: Error {
    case noUrl
    case missingParameter
    case unknown
}
