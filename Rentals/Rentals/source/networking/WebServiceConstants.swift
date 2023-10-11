//
//  WebServiceConstants.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import Foundation

enum WebServiceConstants {
    static let domain: String = "search.outdoorsy.com"

    enum HttpPrefix {
        static let secure: String = "https://"
    }

    enum Endpoint {
        static let rentals: String = "/rentals"
    }

    enum RequestParameterKey: String {
        case raw_json
        case seo_links
        case education
        case average_daily_pricing
        case bounds_ne = "bounds[ne]"
        case bounds_sw = "bounds[sw]"
        case currency
        case filter_excluded_type = "filter[exclude_type]"
        case geoip_address
        case page_limit = "page[limit]"
        case page_offset = "page[offset]"
        case suggested
    }
}


