//
//  UIView+extensions.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import UIKit

// MARK: - Rounding
extension UIView {

    func round(cornerRadius: CGFloat,
               borderWidth width: CGFloat = 0,
               borderColor color: UIColor = UIColor.clear)
    {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

