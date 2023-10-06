//
//  RentalsViewController.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import UIKit
import SimpleLogger

class RentalsViewController: UIViewController, RentalsViewModelConsumer {

    // MARK: - Properties
    private let viewModel: RentalsViewModel
    @IBOutlet private weak var rentalsCollectionView: RentalsCollectionView!
    private lazy var searchController: UISearchController = {
        let result: UISearchController = UISearchController(searchResultsController: nil)
        result.searchResultsUpdater = self
        result.obscuresBackgroundDuringPresentation = false
        result.searchBar.placeholder = NSLocalizedString("Search for a trailer", comment: "Search for a trailer")
        result.delegate = self
        return result
    }()

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
        configureUI()
        configureSearchBar()
    }

    private func configureUI() {
        self.title = NSLocalizedString("Keyword search", comment: "Keyword search")
    }

    private func configureSearchBar() {
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

// MARK: - UISearchControllerDelegate protocol
extension RentalsViewController: UISearchControllerDelegate {

    func willPresentSearchController(_ searchController: UISearchController) {
        // TODO:
        /**
         1. Raise flag on ViewModel that we are displaying search term
         2. Reload data
         */
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        // TODO:
        /**
         1. Drop flag on ViewModel that we are displaying search term
         2. Reload data
         */
    }
}

// MARK: - UISearchResultsUpdating protocol
extension RentalsViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchTerm: String = searchController.searchBar.text else {
            let error = AppError.invalidSearchBarTextObject
            Logger.error.message().object(error)
            return
        }

        // TODO:
        /**
         1. Update search term on ViewModel
         2. Reload data
         */
    }
}
