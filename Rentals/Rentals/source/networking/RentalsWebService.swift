//
//  RentalsWebService.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import Foundation
import SimpleLogger
import Alamofire

final class RentalsWebService: BaseWebService<NetworkEntity.Rentals> {

    init() {
        super.init(endpoint: WebServiceConstants.Endpoint.rentals)
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    private var _requestParameters: Parameters? = [
        WebServiceConstants.RequestParameterKey.raw_json.rawValue: true,
        WebServiceConstants.RequestParameterKey.seo_links.rawValue: true,
        WebServiceConstants.RequestParameterKey.education.rawValue: true,
        WebServiceConstants.RequestParameterKey.average_daily_pricing.rawValue: true,
        WebServiceConstants.RequestParameterKey.bounds_ne.rawValue: "36.232107500326876,-77.16167935021292",
        WebServiceConstants.RequestParameterKey.bounds_sw.rawValue: "32.70984446261892,-78.95992697337977",
        WebServiceConstants.RequestParameterKey.currency.rawValue: "USD",
        WebServiceConstants.RequestParameterKey.filter_excluded_type.rawValue: "utility-trailer,tow-vehicle,other",
        WebServiceConstants.RequestParameterKey.geoip_address.rawValue: "United States",
        WebServiceConstants.RequestParameterKey.locale.rawValue: "en-us",
        WebServiceConstants.RequestParameterKey.page_limit.rawValue: 24,
        WebServiceConstants.RequestParameterKey.page_offset.rawValue: 0,
        WebServiceConstants.RequestParameterKey.suggested.rawValue: true
    ]

    override var requestParameters: Parameters? {
        get {
            return _requestParameters
        }
        set {
            _requestParameters = newValue
        }
    }

    override func parse(_ data: Data) throws -> NetworkEntity.Rentals {
        do {
            let rentals = try JSONDecoder().decode(NetworkEntity.Rentals.self, from: data)
            return rentals
        } catch {
            throw error
        }
    }
}
