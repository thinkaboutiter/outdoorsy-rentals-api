//
//  RootViewModel.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import Foundation
import SimpleLogger

/// APIs for `View` to expose to `ViewModel`
protocol RootViewModelConsumer: AnyObject {}

/// APIs for `ViewModel` to expose to `View`
protocol RootViewModel: AnyObject {
    func setViewModelConsumer(_ newValue: RootViewModelConsumer?)
}

class RootViewModelImpl: RootViewModel {

    // MARK: - Properties
    private weak var viewModelConsumer: RootViewModelConsumer?

    // MARK: - Initialization
    init() {
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    // MARK: - RootViewModel protocol
    func setViewModelConsumer(_ newValue: RootViewModelConsumer?) {
        self.viewModelConsumer = newValue
    }

    // MARK: - RootModelConsumer protocol
}
