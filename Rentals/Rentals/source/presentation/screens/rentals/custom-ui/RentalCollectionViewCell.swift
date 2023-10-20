//
//  RentalCollectionViewCell.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import UIKit
import Alamofire

class RentalCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: RentalCollectionViewCell.self)

    @IBOutlet private weak var rentalImageView: UIImageView!
    @IBOutlet private weak var rentalDescriptionLabel: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    private func configureUI() {
        rentalImageView.round(cornerRadius: 4)
        rentalImageView.contentMode = .scaleAspectFill
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func configureWithRentalDescription(_ rentalDescription: String) {
        rentalDescriptionLabel.text = rentalDescription
    }

    func configureWithRentalImage(_ rentalImageUrl: String) {

//        rentalImageView.image = rentalImage
    }
}
