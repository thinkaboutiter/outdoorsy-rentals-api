//
//  RootViewController.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import UIKit
import UIKit
import SimpleLogger

    /// APIs for `DependecyContainer` to expose.
protocol RootViewControllerFactory: AnyObject {
    func makeRootViewController() -> RootViewController
}

class RootViewController: UIViewController, RootViewModelConsumer {

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
        self.viewModel.setViewModelConsumer(self)
        Logger.success.message()
    }

    deinit {
        Logger.fatal.message()
    }

    // MARK: - RootViewModelConsumer protocol

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

            // Do any additional setup after loading the view.
    }
}


class RootViewControllerFactoryImpl: RootViewControllerFactory {

    init() {}

    func makeRootViewController() -> RootViewController {
        let vm: RootViewModel = RootViewModelImpl()
        let vc = RootViewController(viewModel: vm)
        return vc
    }
}
