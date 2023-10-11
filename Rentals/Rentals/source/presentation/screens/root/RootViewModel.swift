//
//  RootViewModel.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import Foundation
import SimpleLogger

/// APIs for `ViewModel` to expose to `View`
protocol RootViewModel: AnyObject {
    var rentalsViewControllerFactory: RentalsViewControllerFactory { get }
}

class RootViewModelImpl: RootViewModel {

    // MARK: - Properties
    private(set) var rentalsViewControllerFactory: RentalsViewControllerFactory

    // MARK: - Initialization
    init(rentalsViewControllerFactory: RentalsViewControllerFactory) {
        self.rentalsViewControllerFactory = rentalsViewControllerFactory
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }
}
