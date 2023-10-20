//
//  RentalsViewModel.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import Foundation
import SimpleLogger

/// APIs for `View` to expose to `ViewModel`
protocol RentalsViewModelConsumer: AnyObject {
    func didFinishFetchingRentals(on viewModel: RentalsViewModel)
    func didFailFetchingRentals(on viewModel: RentalsViewModel, error: Swift.Error)
}

protocol SearchRentalsViewModel: AnyObject {
    func isDisplayingSearchResults() -> Bool
    func setDisplayingSearchResults(_ newValue: Bool)
    func getSearchTerm() -> String
    func setSearchTerm(_ newValue: String)
    func filteredItems(by term: String) -> [AppEntity.Rental]
}

/// APIs for `ViewModel` to expose to `View`
protocol RentalsViewModel: SearchRentalsViewModel {
    func setViewModelConsumer(_ newValue: RentalsViewModelConsumer?)
    func items() -> [AppEntity.Rental]
    func item(at indexPath: IndexPath) -> AppEntity.Rental?
    func fetchItems()
}

class RentalsViewModelImpl: RentalsViewModel {

    // MARK: - Properties
    private weak var viewModelConsumer: RentalsViewModelConsumer?
    private var displayingSearchResults: Bool = false
    private var searchTerm: String = ""
    private let webService: RentalsWebService
    private let testData: [AppEntity.Rental] = {
        var result = [AppEntity.Rental]()
        for i in 1...40 {
            let rental = AppEntity.Rental.createWith(id: "\(i)", name: "Renatl \(i)", primaryImageUrl: "https://assets.newatlas.com/dims4/default/9ae5278/2147483647/strip/true/crop/1021x681+0+43/resize/1200x800!/quality/90/?url=http%3A%2F%2Fnewatlas-brightspot.s3.amazonaws.com%2Fa9%2F64%2F62b34b8740538db32c13730ef90e%2Fscreen-shot-2023-03-27-at-8.26.08%20PM.png")
            result.append(rental)
        }
        return result
    }()

    // MARK: - Initialization
    init(webService: RentalsWebService = RentalsWebService()) {
        self.webService = webService
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    // MARK: - RentalsViewModel protocol
    func setViewModelConsumer(_ newValue: RentalsViewModelConsumer?) {
        self.viewModelConsumer = newValue
    }

    func items() -> [AppEntity.Rental] {
        let result: [AppEntity.Rental]
        if isDisplayingSearchResults() {
            let term = getSearchTerm()
            result = filteredItems(by: term)
        } else {
            result = testData
        }
        return result
    }

    func item(at indexPath: IndexPath) -> AppEntity.Rental? {
        let index = indexPath.item
        let collection = items()
        let result = collection[safeAt: index]
        return result
    }

    func fetchItems() {
        webService.fetch { resources in
            // todo: convert Network entities to app entities
            // todo: notify view controller
        } failure: { error in
            // todo: notify view controller passing the error
        }
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

    func filteredItems(by term: String) -> [AppEntity.Rental] {
        let result = testData.filter { element in
            element.name.lowercased().contains(term.lowercased())
        }
        return result
    }
}
