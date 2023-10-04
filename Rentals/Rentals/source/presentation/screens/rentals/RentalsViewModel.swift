//
//  RentalsViewModel.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import SimpleLogger

/// APIs for `View` to expose to `ViewModel`
protocol RentalsViewModelConsumer: AnyObject {}

/// APIs for `ViewModel` to expose to `View`
protocol RentalsViewModel: AnyObject {
    func setViewModelConsumer(_ newValue: RentalsViewModelConsumer?)
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

    // MARK: - RentalsModelConsumer protocol
}
