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
    @IBOutlet private weak var rentalsCollectionView: RentalsCollectionView! {
        didSet {
            let identifier = RentalCollectionViewCell.identifier
            rentalsCollectionView.register(UINib(nibName: identifier, bundle: nil),
                                           forCellWithReuseIdentifier: identifier)
            rentalsCollectionView.delegate = self
            rentalsCollectionView.dataSource = self
        }
    }
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

        checkWebService()
    }

    private let ws = RentalsWebService()

    private func checkWebService() {
        ws.fetch { resources in
            Logger.network.message().object(resources)
        } failure: { error in
            Logger.error.message().object(error)
        }

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
        viewModel.setDisplayingSearchResults(true)
        rentalsCollectionView.reloadData()
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        viewModel.setDisplayingSearchResults(false)
        rentalsCollectionView.reloadData()
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
        viewModel.setSearchTerm(searchTerm)
        rentalsCollectionView.reloadData()
    }
}

extension RentalsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = RentalCollectionViewCell.identifier
        guard let cell: RentalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? RentalCollectionViewCell else {
            let message: String = "Unable to dequeue valid \(identifier)!"
            Logger.error.message(message)
            fatalError(message)
        }
        guard let data = viewModel.item(at: indexPath) else {
            let message: String = "Unable to find item for indexPath=\(indexPath)!"
            Logger.error.message(message)
            return cell
        }
        cell.configureWithRentalDescription(data)
        let testImage = UIImage(named: "test-rv")
        cell.configureWithRentalImage(testImage)
        return cell
    }
}

extension RentalsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension RentalsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return self.itemSize(for: collectionView, at: indexPath)
    }

    private func itemSize(for collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        guard let provider: CollectionViewDimensionsProvider = collectionView as? CollectionViewDimensionsProvider else {
            let message: String = "Unable to obtain valid \(String(describing: CollectionViewDimensionsProvider.self)) object!"
            debugPrint("❌ \(#file) » \(#function) » \(#line)", message, separator: "\n")
            return CGSize.zero
        }
        let result: CGSize = self.itemSize(for: provider,
                                           totalWidth: collectionView.bounds.width)
        return result
    }

    private func itemSize(for provider: CollectionViewDimensionsProvider,
                          totalWidth: CGFloat) -> CGSize
    {
        let item_width: CGFloat = (
            totalWidth
                - provider.paddingLeft
                - provider.paddingRight
                - CGFloat(provider.itemsPerRow - 1) * provider.minimumInteritemSpacing
            ) / CGFloat(provider.itemsPerRow)

        let item_height: CGFloat = item_width / provider.itemWidthToHeightRatio
        return CGSize(width: item_width, height: item_height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets
    {
        guard let valid_dimensionsProvider: CollectionViewDimensionsProvider = collectionView as? CollectionViewDimensionsProvider else {
            let message: String = "Unable to obtain valid \(String(describing: CollectionViewDimensionsProvider.self)) object!"
            debugPrint("❌ \(#file) » \(#function) » \(#line)", message, separator: "\n")
            return UIEdgeInsets.zero
        }
        return valid_dimensionsProvider.sectionEdgeInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        guard let valid_dimensionsProvider: CollectionViewDimensionsProvider = collectionView as? CollectionViewDimensionsProvider else {
            let message: String = "Unable to obtain valid \(String(describing: CollectionViewDimensionsProvider.self)) object!"
            debugPrint("❌ \(#file) » \(#function) » \(#line)", message, separator: "\n")
            return 0
        }
        return valid_dimensionsProvider.minimumInteritemSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        guard let valid_dimensionsProvider: CollectionViewDimensionsProvider = collectionView as? CollectionViewDimensionsProvider else {
            let message: String = "Unable to obtain valid \(String(describing: CollectionViewDimensionsProvider.self)) object!"
            debugPrint("❌ \(#file) » \(#function) » \(#line)", message, separator: "\n")
            return 0
        }
        return valid_dimensionsProvider.minimumLineSpacing
    }
}
