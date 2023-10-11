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
    struct Rentals {
        let data: [Datum]?
        let meta: Meta?
        let suggestions: NSNull?
    }

    // MARK: - Datum
    struct Datum {
        let id: Int?
        let name, filteredName, type: String?
        let rentalCategory: RentalCategory?
        let displayVehicleType, description, filteredDescription, summary: String?
        let vehicleClass, vehicleMake, vehicleModel: String?
        let vehicleGvwr, vehicleBoxLength, vehicleLengthWithHitch, vehicleAmps: Int?
        let vehicleWidth, vehicleHeight, vehicleDryWeight: Int?
        let vehicleLicensePlateState, vehicleTitle, slug: String?
        let vehicleYear: Int?
        let vehicleLength: Double?
        let availabilitySet: Bool?
        let created, updated: Date?
        let lastPublished, firstPublished: String?
        let ownerUserID: Int?
        let dealer, pro, unavailable, hasBeenPublished: Bool?
        let hasCheckoutQuestions: Bool?
        let descriptionIncluded, descriptionRecommendations, descriptionOther: String?
        let published, hidden, external: Bool?
        let features: Features?
        let featuresMap: NSNull?
        let coachnetRequired, coachnetReady, instantBook: Bool?
        let instantBookLeeway, sleeps, seatbelts, sleepsAdults: Int?
        let sleepsKids, rentalPriceUsageItemID: Int?
        let rentalPriceUsageItem: RentalPriceUsageItem?
        let presentmentCurrency, settlementCurrency: Currency?
        let favorite, delivery: Bool?
        let deliveryRadius, deliveryRadiusMiles: Int?
        let deliveryRadiusUnit: Unit?
        let originalURL: String?
        let primaryImageURL: String?
        let images: [Image]?
        let items: [Item]?
        let position, score, reviewsNum, groupScore: Int?
        let groupReviewsScore, groupReviewsNum, favoriteCount: Int?
        let location: Location?
        let geopoint: Geopoint?
        let groupOnMap: Bool?
        let currentLocationID: Int?
        let locale: Locale?
        let bookingPrices: [BookingPrice]?
        let pricePerDay, pricePerWeek, pricePerMonth, lowPricePerDay: Int?
        let lowPricePerWeek, lowPricePerMonth, weeklyDiscount, monthlyDiscount: Int?
        let securityDeposit, minimumDeposit, depositPercentage: Int?
        let useDayPricing, useTaxInclusivePricing: Bool?
        let cancelPolicy: CancelPolicy?
        let cancelPolicyComboBookings: String?
        let minimumDays, requestLessThanMinimumDays: Int?
        let activeOptions: ActiveOptions?
        let cancelText, houseRules: String?
        let prepFee: PrepFee?
        let generatorUsageItemID: Int?
        let generatorUsageItem: GeneratorUsageItem?
        let mileageUsageItemID: Int?
        let mileageUsageItem: MileageUsageItem?
        let deliveryUsageItemID: Int?
        let deliveryUsageItem: DeliveryUsageItem?
        let insuranceRenterAdjustable: Bool?
        let insuranceState: InsuranceState?
        let insuranceCoverage: String?
        let insuranceEligible: Bool?
        let insurancePlan: InsurancePlan?
        let customInsuranceText: String?
        let breadcrumb, nearbyContent, education: NSNull?
        let taxRates: [TaxRate]?
        let seoContent: SEOContent?
        let bookings: NSNull?
        let childRentals: [ChildRental]?
        let pickupUnavailable, dropoffUnavailable: Unavailable?
        let combinedSpecialHours: [CombinedSpecialHour]?
        let tags: [Any?]?
        let localizedContent: NSNull?
        let parentID, childrenCount: Int?
        let childRentalIDS: NSNull?
        let preferredPrimaryImage: PreferredPrimaryImage?
        let smartPhotoScore, ownerScore, rentalScore: Int?
        let ranking: Ranking?
        let sortScore: Double?
        let distributedRatings: DistributedRatings?
        let averageRatings: [String: Double]?
        let averageReviews: AverageReviews?
        let reviewScores: ReviewScores?
        let listingQuestions: [ListingQuestion]?
        let distance: Double?
        let dates: [DateElement]?
        let stay: NSNull?
        let checkIn, checkOut: Int?
        let hostNotes: String?
    }

    // MARK: - ActiveOptions
    struct ActiveOptions {
        let date: String?
        let dayPrice, weekPrice, weeklyRatePerDay: Int?
        let weeklyDiscountPercentage: Double?
        let monthPrice, monthlyRatePerDay: Int?
        let monthlyDiscountPercentage: Double?
        let cancelPolicy: CancelPolicy?
        let cancelPolicyComboBookings: String?
        let minimumDays: Int?
        let useDayPricing, useTaxInclusivePricing, instantBook: Bool?
    }

    enum CancelPolicy: String {
        case flexible
        case moderate
        case strict
    }

    // MARK: - AverageReviews
    struct AverageReviews {
        let score: Int?
        let rental: [Rental]?
        let owner: [Owner]?
    }

    // MARK: - Owner
    struct Owner {
        let key, name: String?
        let score, percentage: Int?
    }

    // MARK: - Rental
    struct Rental {
        let key, name: String?
        let score, percentage: Double?
    }

    // MARK: - BookingPrice
    struct BookingPrice {
        let rentalID: Int?
        let dateRange: DateElement?
        let bookingStart, bookingEnd: String?
        let minimumBookingDays, price, maxPrice: Int?
        let range: Range?
    }

    // MARK: - DateElement
    struct DateElement {
        let gte, lte: String?
    }

    enum Range: String {
        case daily
        case monthly
        case weekly
    }

    // MARK: - ChildRental
    struct ChildRental {
        let id: Int?
        let bookings: [DateElement]?
    }

    // MARK: - CombinedSpecialHour
    struct CombinedSpecialHour {
        let id: Int?
        let startDate, endDate: String?
        let pickUpUnavailable, dropOffUnavailable: Bool?
    }

    enum Unit: String {
        case empty
        case mile
    }

    // MARK: - DeliveryUsageItem
    struct DeliveryUsageItem {
        let id, ownerID: Int?
        let name: Name?
        let unit: Unit?
        let feeType: DeliveryUsageItemFeeType?
        let included: Int?
        let includedPeriod: DeliveryUsageItemIncludedPeriod?
        let unlimited, archived: Bool?
        let taxRateID: Int?
        let singleTier: Bool?
        let tiers: [Tier]?
    }

    enum DeliveryUsageItemFeeType: String {
        case delivery
        case empty
    }

    enum DeliveryUsageItemIncludedPeriod: String {
        case empty
        case trip
    }

    enum Name: String {
        case delivery
        case empty
    }

    // MARK: - Tier
    struct Tier {
        let id, usageBasedItemID, price, maximum: Int?
        let minimumFee: Int?
    }

    // MARK: - DistributedRatings
    struct DistributedRatings {
        let score: Score?
    }

    // MARK: - Score
    struct Score {
        let r1, r2, r3, r4: Int?
        let r5: Int?
    }

    // MARK: - Unavailable
    struct Unavailable {
        let sunday, monday, tuesday, wednesday: Bool?
        let thursday, friday, saturday: Bool?
    }

    // MARK: - Features
    struct Features {
        let airConditioner, audioInputs, awning, backupCamera: Bool?
        let bedsBunk, bedsDinetteConversion, bedsFoldOutSofa: Int?
        let bedsFull, bedsKing: Int?
        let bedsOther: Int?
        let bedsQueen, bedsTwin: Int?
        let bikeRack, brakeController, burningManFriendly, cdPlayer: Bool?
        let ceilingFan: Bool?
        let connectorType: String?
        let diningTable, extraStorage, festivalFriendly, generator: Bool?
        let grayTank: Int?
        let handicapAccessible, heater: Bool?
        let hitchWeight: Int?
        let hookupElectric, hookupSewer, hookupWater, hotWaterTank: Bool?
        let insideShower, internationalTravelAllowed, inverter, kitchenSink: Bool?
        let levelingJacks, microwave: Bool?
        let minimumAge, mpg: Int?
        let oneWayRentals, outsideShower, oven, petFriendly: Bool?
        let propaneTank: Int?
        let providesReceivers, radio, refrigerator, satellite: Bool?
        let sewageTank: Int?
        let skylight: Bool?
        let slideOuts: Int?
        let smokingAllowed, solar, stove, tailgateFriendly: Bool?
        let toilet, towHitch: Bool?
        let trailerWeight: Int?
        let tvDVD, washerDryer: Bool?
        let waterTank: Int?
        let wifi: Bool?
        let fuelTank: Int?
        let fuelType, transmission: String?
        let baseWeight, carryingCapacity, grossVehicleWeight: Int?
    }

    // MARK: - GeneratorUsageItem
    struct GeneratorUsageItem {
        let id, ownerID: Int?
        let name: GeneratorUsageItemFeeType?
        let unit: UnitEnum?
        let feeType: GeneratorUsageItemFeeType?
        let included: Int?
        let includedPeriod: UnitEnum?
        let unlimited, archived: Bool?
        let taxRateID: Int?
        let singleTier: Bool?
        let tiers: [Tier]?
    }

    enum GeneratorUsageItemFeeType: String {
        case empty
        case generator
    }

    enum UnitEnum: String {
        case daily
        case empty
        case hour
    }

    // MARK: - Geopoint
    struct Geopoint {
        let lat, lon: Double?
    }

    // MARK: - Image
    struct Image {
        let id, rentalID: Int?
        let primary: Bool?
        let category: ImageCategory?
        let position: Int?
        let tags: Tags?
        let description: String?
        let skipEnhance, video: Bool?
        let url: String?
        let best: Bool?
        let status: Status?
    }

    // MARK: - ImageCategory
    struct ImageCategory {
        let slug: Slug?
        let name: String?
    }

    enum Slug: String {
        case bathroom
        case bedroom
        case dining
        case driving
        case exterior
        case floorplan
        case kitchen
        case other
        case travel
    }

    enum Status: String {
        case approved
        case rejected
    }

    enum Tags: String {
        case empty
        case exterior
        case floorplan
    }

    // MARK: - InsurancePlan
    struct InsurancePlan {
        let id: Int?
        let label: Label?
        let requiresDriverVerification: Bool?
        let renterHeadline, renterBody: String?
    }

    enum Label: String {
        case outdoorsyCamperVanProtection
        case outdoorsyDrivableProtection
        case outdoorsyTowableProtection
    }

    enum InsuranceState: String {
        case approved
        case ineligible
    }

    // MARK: - Item
    struct Item {
        let id, rentalID: Int?
        let name, description: String?
        let itemRequired, daily: Bool?
        let price, position, available: Int?
        let category: String?
        let deferred: Bool?
    }

    // MARK: - ListingQuestion
    struct ListingQuestion {
        let question, answer: String?
    }

    // MARK: - Locale
    struct Locale {
        let baseCurrency: Currency?
        let distanceUnit: DistanceUnit?
        let weightUnit: WeightUnit?
        let lengthUnit: LengthUnit?
        let liquidUnit: LiquidUnit?
    }

    enum Currency: String {
        case usd
    }

    enum DistanceUnit: String {
        case miles
    }

    enum LengthUnit: String {
        case feet
    }

    enum LiquidUnit: String {
        case gallons
    }

    enum WeightUnit: String {
        case lbs
    }

    // MARK: - Location
    struct Location {
        let city: String?
        let state: State?
        let county: County?
        let country: Country?
        let zip: String?
        let lat, lng: Double?
    }

    enum Country: String {
        case us
    }

    enum County: String {
        case cumberlandCounty
        case empty
        case newHanoverCounty
    }

    enum State: String {
        case nc
        case sc
    }

    // MARK: - MileageUsageItem
    struct MileageUsageItem {
        let id, ownerID: Int?
        let name: MileageUsageItemFeeType?
        let unit: Unit?
        let feeType: MileageUsageItemFeeType?
        let included: Int?
        let includedPeriod: MileageUsageItemIncludedPeriod?
        let unlimited, archived: Bool?
        let taxRateID: Int?
        let singleTier: Bool?
        let tiers: [Tier]?
    }

    enum MileageUsageItemFeeType: String {
        case empty
        case mileage
    }

    enum MileageUsageItemIncludedPeriod: String {
        case daily
        case mile
    }

    // MARK: - PreferredPrimaryImage
    struct PreferredPrimaryImage {
        let id, rentalID: Int?
        let primary: Bool?
        let position: Int?
        let tags, description: String?
        let skipEnhance, video: Bool?
        let url: String?
        let best: Bool?
        let status: String?
    }

    // MARK: - PrepFee
    struct PrepFee {
        let amount: Int?
        let description: String?
    }

    // MARK: - Ranking
    struct Ranking {
        let distanceWeight: DistanceWeight?
        let distanceWeightProd: Double?
        let isNewListing: Int?
        let modelName: ModelName?
        let originalScore: Int?
        let rankingScore, rankingScore2, rankingScore3: Double?
    }

    // MARK: - DistanceWeight
    struct DistanceWeight {
        let control, test1, test2, test3: Double?
    }

    enum ModelName: String {
        case modelGbtWeb072522
    }

    enum RentalCategory: String {
        case rv
    }

    // MARK: - RentalPriceUsageItem
    struct RentalPriceUsageItem {
        let id, ownerID: Int?
        let name, unit, feeType: String?
        let included: Int?
        let includedPeriod: String?
        let unlimited, archived: Bool?
        let taxRateID: Int?
        let singleTier: Bool?
    }

    // MARK: - ReviewScores
    struct ReviewScores {
        let bayesianRating: Double?
    }

    // MARK: - SEOContent
    struct SEOContent {
        let category: [CategoryElement]?
    }

    // MARK: - CategoryElement
    struct CategoryElement {
        let id: Int?
        let title: String?
        let url: String?
    }

    // MARK: - TaxRate
    struct TaxRate {
        let id: Int?
        let rate: Double?
    }

    // MARK: - Meta
    struct Meta {
        let radius: Int?
        let lat, lng: Double?
        let country: Country?
        let countryName: String?
        let total, totalUnavailable, startPosition, stopPosition: Int?
        let priceMax, priceMin, priceAverage, priceMedian: Int?
        let priceHistogram: PriceHistogram?
        let vehicleTypes: [VehicleType]?
        let locale: String?
        let suggested: Bool?
        let experiments, experimentsData, request: Experiments?
        let flexibleDates: NSNull?
        let isBlended: Bool?
    }

    // MARK: - Experiments
    struct Experiments {
    }

    // MARK: - PriceHistogram
    struct PriceHistogram {
        let data: [Int]?
        let maxValue: Int?
    }

    // MARK: - VehicleType
    struct VehicleType {
        let type, label: String?
        let style: Style?
    }

    enum Style: String {
        case both
        case drivable
        case towable
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
