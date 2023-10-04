//
//  RentalsViewController.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import UIKit
import SimpleLogger

    /// APIs for `DependecyContainer` to expose.
protocol RentalsViewControllerFactory {
    func makeRentalsViewController() -> RentalsViewController
}

class RentalsViewController: UIViewController, RentalsViewModelConsumer {

    // MARK: - Properties
    private let viewModel: RentalsViewModel

    // MARK: - Initialization
    @available(*, unavailable, message: "Not supported!")
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented!")
    }

    @available(*, unavailable, message: "Not supported!")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not implemented!")
    }

    init(viewModel: RentalsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: RentalsViewController.self), bundle: nil)
        self.viewModel.setViewModelConsumer(self)
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    // MARK: - RentalsViewModelConsumer protocol

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
