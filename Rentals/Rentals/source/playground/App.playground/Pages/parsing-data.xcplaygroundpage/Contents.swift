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
        let id: Int?
        let name: String?
        let primaryImageURL: String?

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case primaryImageURL = "primary_image_url"
        }
    }
}

enum AppEntity {

    struct Rental {
        let id: Int
        let name: String
        let primaryImageUrl: String

        init(datum: NetworkEntity.Datum) throws {
            guard let id = datum.id else {
                throw AppEntity.Rental.Error.invalidId
            }
            self.id = id

            guard let name = datum.name else {
                throw AppEntity.Rental.Error.invalidName
            }
            self.name = name

            guard let primaryImageUrl = datum.primaryImageURL else {
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


// read json file
do {
    guard let fileUrl = Bundle.main.url(forResource: "sampleResponse.json", withExtension: nil) else {
        fatalError()
    }
    let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
    let data = try Data(contentsOf: fileUrl, options: Data.ReadingOptions.alwaysMapped)

    let rentals = try JSONDecoder().decode(NetworkEntity.Rentals.self, from: data)
    if let rentalsData = rentals.data {
        for rental in rentalsData {
            print(rental)
        }
    }
} catch {
    print(error)
}

