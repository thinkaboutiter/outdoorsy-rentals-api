//
//  RentalsViewControllerFactory.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import Foundation

protocol RentalsViewControllerFactory: AnyObject {
    func makeRentalsViewController() -> RentalsViewController
}

class RentalsViewControllerFactoryImpl: RentalsViewControllerFactory {

    init() {}

    func makeRentalsViewController() -> RentalsViewController {
        let vm: RentalsViewModel = RentalsViewModelImpl()
        let vc = RentalsViewController(viewModel: vm)
        return vc
    }
}
