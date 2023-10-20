//
//  Rentals.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rentals = try? JSONDecoder().decode(Rentals.self, from: jsonData)

import Foundation

enum NetworkEntity {

    // MARK: - Rentals
    struct Rentals: Decodable {
        let data: [Datum]?

        enum CodingKeys: String, CodingKey {
            case data
        }
    }

    // MARK: - Datum
    struct Datum: Decodable {
        let id: String?
        let attributes: DatumAttributes?
    }

    struct DatumAttributes: Decodable {
        let name: String?
        let primaryImageURL: String?

        enum CodingKeys: String, CodingKey {
            case name
            case primaryImageURL = "primary_image_url"
        }
    }
}

enum AppEntity {

    struct Rental {
        let id: String
        let name: String
        let primaryImageUrl: String

        init(datum: NetworkEntity.Datum) throws {
            guard let id = datum.id else {
                throw AppEntity.Rental.Error.invalidId
            }
            self.id = id

            guard let name = datum.attributes?.name else {
                throw AppEntity.Rental.Error.invalidName
            }
            self.name = name

            guard let primaryImageUrl = datum.attributes?.primaryImageURL else {
                throw AppEntity.Rental.Error.invalidPrimaryImageUrl
            }
            self.primaryImageUrl = primaryImageUrl
        }

        enum Error: Swift.Error, CustomStringConvertible {
            case invalidId
            case invalidName
            case invalidPrimaryImageUrl

            var description: String {
                let result: String
                switch self {
                case .invalidId:
                    result = "Invalid id"
                case .invalidName:
                    result = "Invalid name"
                case .invalidPrimaryImageUrl:
                    result = "Invalid primaryImageUrl"
                }
                return result
            }
        }
    }
}
