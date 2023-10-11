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

/// APIs for `ViewModel` to expose to `View`
protocol RentalsViewModel: AnyObject {
    func setViewModelConsumer(_ newValue: RentalsViewModelConsumer?)
    func items() -> [String]
    func item(at indexPath: IndexPath) -> String?
}

class RentalsViewModelImpl: RentalsViewModel {

    // MARK: - Properties
    private weak var viewModelConsumer: RentalsViewModelConsumer?

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
        let result = [
            "rental 1",
            "rental 2",
            "rental 3",
            "retnal 4"
        ]
        return result
    }

    func item(at indexPath: IndexPath) -> String? {
        let index = indexPath.item
        let collection = items()
        let result = collection[safeAt: index]
        return result
    }

    // MARK: - RentalsModelConsumer protocol
}
