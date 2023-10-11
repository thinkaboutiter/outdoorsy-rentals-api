//
//  WebService.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import Foundation
import Alamofire

/// WebService protocol.
protocol WebService {

    /// Base endpoint for all services.
    static func baseEndpoint() -> String

    /// Endpoint for particular web service instance.
    func instanceEndpoint() -> String

    /// Complete endpoint.
    func serviceEndpoint() -> String

    /// Http verb.
    var httpVerb: Alamofire.HTTPMethod { get set }

    /// Request headers.
    var requestHeaders: Alamofire.HTTPHeaders? { get set }

    /// Request parameters
    var requestParameters: Parameters? { get set }

    /// Request parameters encoding.
    func requestParametersEncoding() -> Alamofire.ParameterEncoding
}
