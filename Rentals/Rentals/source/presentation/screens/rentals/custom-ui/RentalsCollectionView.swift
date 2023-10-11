//
//  RentalsCollectionView.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import UIKit

class RentalsCollectionView: UICollectionView {}

protocol CollectionViewDimensionsProvider {
    var paddingLeft: CGFloat { get }
    var paddingRight: CGFloat { get }
    var minimumInteritemSpacing: CGFloat { get }
    var minimumLineSpacing: CGFloat { get }
    var itemsPerRow: UInt { get }
    var itemWidthToHeightRatio: CGFloat { get }
    var sectionEdgeInsets: UIEdgeInsets { get }
}

extension RentalsCollectionView: CollectionViewDimensionsProvider {

    var paddingLeft: CGFloat {
        return Dimensions.paddingLeft
    }

    var paddingRight: CGFloat {
        return Dimensions.paddingRight
    }

    var minimumInteritemSpacing: CGFloat {
        return Dimensions.minimumInteritemSpacing
    }

    var minimumLineSpacing: CGFloat {
        return Dimensions.minimumLineSpacing
    }

    var itemsPerRow: UInt {
        return Dimensions.itemsPerRow
    }

    var itemWidthToHeightRatio: CGFloat {
        return Dimensions.itemWidthToHeightRatio
    }

    var sectionEdgeInsets: UIEdgeInsets {
        return Dimensions.sectionEdgeInsets
    }
}

private extension RentalsCollectionView {

    enum Dimensions {
        static let paddingLeft: CGFloat = 16
        static let paddingRight: CGFloat = 16
        static let minimumInteritemSpacing: CGFloat = 24
        static let minimumLineSpacing: CGFloat = 16
        static var itemsPerRow: UInt {
            let result: UInt
            let width: CGFloat = UIScreen.main.bounds.width
            let height: CGFloat = UIScreen.main.bounds.height
            if UIDevice.current.userInterfaceIdiom == .phone {
                if height > width {
                    result = 1
                }
                else {
                    result = 2
                }
            }
            else {
                result = 3
            }
            return result
        }
        static var itemWidthToHeightRatio: CGFloat {
            let result: CGFloat
            if UIDevice.current.userInterfaceIdiom == .phone {
                result = 16.0 / 4.0
            }
            else {
                result = 16.0 / 4.0
            }
            return result
        }
        static var sectionEdgeInsets: UIEdgeInsets {
            return UIEdgeInsets(top: self.minimumLineSpacing,
                                left: self.paddingLeft,
                                bottom: self.minimumLineSpacing,
                                right: self.paddingRight)
        }
    }
}
