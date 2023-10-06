//
//  RentalCollectionViewCell.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import UIKit

class RentalCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: RentalCollectionViewCell.self)

    @IBOutlet private weak var rentalImageView: UIImageView!
    @IBOutlet private weak var rentalDescriptionLabel: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func configure(with rentalDescription: String) {
        rentalDescriptionLabel.text = rentalDescription
    }

    func configure(with rentalImage: UIImage) {
        rentalImageView.image = rentalImage
    }
}
