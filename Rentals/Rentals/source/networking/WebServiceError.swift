//
//  WebServiceError.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import Foundation

enum WebServiceError: Swift.Error, CustomStringConvertible {
    case generic
    case invalidStatusCode
    case invalidResponseObject
    case unableToObtainResponseObject

    var description: String {
        let result: String
        switch self {
        case .generic:
            result = "Something went wrong!"
        case .invalidStatusCode:
            result = "Invalid status code!"
        case .invalidResponseObject:
            result = "Invalid response object!"
        case .unableToObtainResponseObject:
            result = "Unable to obtain response object!"
        }
        return result
    }
}
