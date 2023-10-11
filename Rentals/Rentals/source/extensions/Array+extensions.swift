//
//  Array+extensions.swift
//  Rentals
//
//  Created by Boyan Yankov on 11.10.23.
//

import Foundation
import SimpleLogger

// MARK: - Safe element at index
public extension Array {
    subscript(safeAt index: Int) -> Element? {
        var result: Element? = nil
        let range = 0..<count
        guard range ~= index else {
            let message: String = "index=\(index) out of range=\(range)!"
            Logger.warning.message(message)
            return result
        }
        result = self[index]
        return result
    }
}
