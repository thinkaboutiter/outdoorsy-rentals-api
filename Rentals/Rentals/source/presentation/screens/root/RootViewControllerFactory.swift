//
//  RootViewControllerFactory.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import Foundation

protocol RootViewControllerFactory: AnyObject {
    func makeRootViewController() -> RootViewController
}

class RootViewControllerFactoryImpl: RootViewControllerFactory {

    private let rentalViewControllerFactory: RentalsViewControllerFactory

    init(rentalViewControlerFactory: RentalsViewControllerFactory = RentalsViewControllerFactoryImpl()) {
        self.rentalViewControllerFactory = rentalViewControlerFactory
    }

    func makeRootViewController() -> RootViewController {
        let vm: RootViewModel = RootViewModelImpl(rentalsViewControllerFactory: rentalViewControllerFactory)
        let vc = RootViewController(viewModel: vm)
        return vc
    }
}
