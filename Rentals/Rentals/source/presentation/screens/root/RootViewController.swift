//
//  RootViewController.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import UIKit
import UIKit
import SimpleLogger

class RootViewController: UIViewController {

    // MARK: - Properties
    private let viewModel: RootViewModel

    // MARK: - Initialization
    @available(*, unavailable, message: "Not supported!")
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented!")
    }

    @available(*, unavailable, message: "Not supported!")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not implemented!")
    }

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: RootViewController.self), bundle: nil)
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedRentalsViewController()
    }
}

extension RootViewController {
    private func embedRentalsViewController() {
        let vc = viewModel.rentalsViewControllerFactory.makeRentalsViewController()
        let nc = UINavigationController()
        nc.pushViewController(vc, animated: false)
        do {
            try self.embed(nc,
                           containerView: self.view,
                           positionChildViewIntoContainerView: nil)
        } catch {
            Logger.error.message().object(error)
        }
    }
}

