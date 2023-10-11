//
//  AppError.swift
//  Rentals
//
//  Created by Boyan Yankov on 6.10.23.
//

import Foundation

enum AppError: Swift.Error, CustomStringConvertible {
    case generic
    case invalidSearchBarTextObject

    var description: String {
        let result: String
        switch self {
        case .generic:
            result = NSLocalizedString("Something went wrong!", comment: "Something went wrong!")
        case .invalidSearchBarTextObject:
            result = NSLocalizedString("Invalid searchBar.text object!", comment: "Invalid searchBar.text object!")
        }
        return result
    }
}
