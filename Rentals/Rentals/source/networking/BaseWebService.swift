//
//  BaseWebService.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import Foundation
import Alamofire
import SimpleLogger

class BaseWebService<ApiResponseType>: WebService {
    // MARK: - Properties
    let endpoint: String
    private var request: Alamofire.Request?

    // MARK: - Initialization
    init(endpoint: String) {
        self.endpoint = endpoint
    }

    deinit {
        self.request?.cancel()
    }

    static func baseEndpoint() -> String {
        let result = (
            WebServiceConstants.HttpPrefix.secure
            + WebServiceConstants.domain
        )
        return result
    }

    final func instanceEndpoint() -> String {
        return endpoint
    }

    final func serviceEndpoint() -> String {
        let baseEndpoint: String = type(of: self).baseEndpoint()
        let instanceEndpoint: String = self.instanceEndpoint()
        let result: String = "\(baseEndpoint)\(instanceEndpoint)"
        return result
    }

    var httpVerb: HTTPMethod = .get
    var requestHeaders: Alamofire.HTTPHeaders?
    var requestParameters: Parameters?

    func requestParametersEncoding() -> ParameterEncoding {
        return URLEncoding.default
    }

    // MARK: - Fetching
    func fetch(success: @escaping (_ resources: ApiResponseType) -> Void,
               failure: @escaping (_ error: Swift.Error) -> Void)
    {
        self.request?.cancel()
        self.request = AF
            .request(self.serviceEndpoint(),
                     method: self.httpVerb,
                     parameters: self.requestParameters,
                     encoding: self.requestParametersEncoding(),
                     headers: self.requestHeaders)
            .responseData(completionHandler: { (response: AFDataResponse<Data>) in
                Logger.network.message("request:").object(response.request)
                Logger.network.message("request.allHTTPHeaderFields:").object(response.request?.allHTTPHeaderFields)
                Logger.network.message("response:").object(response.response)

                do {
                    try self.validateResponse(response)
                    guard let data: Data = response.data else {
                        let error = WebServiceError.unableToObtainResponseObject
                        failure(error)
                        return
                    }
                    let parsedResources: ApiResponseType = try self.parse(data)
                    success(parsedResources)
                } catch {
                    failure(error)
                }
            })
    }

    // MARK: - Parsing
    func parse(_ data: Data) throws -> ApiResponseType {
        fatalError("subclass should override!")
    }

    private func validateResponse(_ response: AFDataResponse<Data>) throws {
        // check error
        guard response.error == nil else {
            throw response.error! as NSError
        }

        // check response object
        guard let httpUrlResponse: HTTPURLResponse = response.response else {
            throw WebServiceError.invalidResponseObject
        }

        // check status code
        guard 200...299 ~= httpUrlResponse.statusCode else {
            throw WebServiceError.invalidStatusCode
        }
    }
}
