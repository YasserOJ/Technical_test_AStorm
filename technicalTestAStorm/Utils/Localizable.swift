//
//  Localizable.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 25/8/2022.
//

import Foundation
protocol LocalizableDelegate {
    // Properties for NSLocalizedString function
    var rawValue: String { get }
    var tableName: String? { get }
    var localized: String { get }
}

// MARK: - Default values of the Localizable protocol properties for the NSLocalizedString function
extension LocalizableDelegate {

    var tableName: String? {
        return nil
    }
    var bundle: Bundle {
        return Bundle.main
    }

    var localized: String {
        return bundle.localizedString(forKey: rawValue, value: nil, table: tableName)
    }
}
