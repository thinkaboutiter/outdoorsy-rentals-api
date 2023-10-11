//
//  RentalsViewModel.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import Foundation
import SimpleLogger

/// APIs for `View` to expose to `ViewModel`
protocol RentalsViewModelConsumer: AnyObject {}

protocol SearchRentalsViewModel: AnyObject {
    func isDisplayingSearchResults() -> Bool
    func setDisplayingSearchResults(_ newValue: Bool)
    func getSearchTerm() -> String
    func setSearchTerm(_ newValue: String)
    func filteredItems(by term: String) -> [String]
}

/// APIs for `ViewModel` to expose to `View`
protocol RentalsViewModel: SearchRentalsViewModel {
    func setViewModelConsumer(_ newValue: RentalsViewModelConsumer?)
    func items() -> [String]
    func item(at indexPath: IndexPath) -> String?
}

class RentalsViewModelImpl: RentalsViewModel {

    // MARK: - Properties
    private weak var viewModelConsumer: RentalsViewModelConsumer?
    private var displayingSearchResults: Bool = false
    private var searchTerm: String = ""
    private let testData: [String] = {
        var result = [String]()
        for i in 1...40 {
            let item = "rental \(i)"
            result.append(item)
        }
        return result
    }()

    // MARK: - Initialization
    init() {
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    // MARK: - RentalsViewModel protocol
    func setViewModelConsumer(_ newValue: RentalsViewModelConsumer?) {
        self.viewModelConsumer = newValue
    }

    func items() -> [String] {
        let result: [String]
        if isDisplayingSearchResults() {
            let term = getSearchTerm()
            result = filteredItems(by: term)
        } else {
            result = testData
        }
        return result
    }

    func item(at indexPath: IndexPath) -> String? {
        let index = indexPath.item
        let collection = items()
        let result = collection[safeAt: index]
        return result
    }

    // MARK: - SearchRentalsViewModel protocol
    func isDisplayingSearchResults() -> Bool {
        return displayingSearchResults
    }

    func setDisplayingSearchResults(_ newValue: Bool) {
        displayingSearchResults = newValue
    }

    func getSearchTerm() -> String {
        return searchTerm
    }

    func setSearchTerm(_ newValue: String) {
        searchTerm = newValue
    }

    func filteredItems(by term: String) -> [String] {
        let result = testData.filter { element in
            element.lowercased().contains(term.lowercased())
        }
        return result
    }
}
