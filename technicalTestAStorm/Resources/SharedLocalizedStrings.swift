//
//  SharedLocalizedStrings.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 25/8/2022.
//

import Foundation

enum SharedLocalizedString : String, LocalizableDelegate {
    case yourCitiesTitle = "yourCitiesTitle"
    case addCityTitle = "addCityTitle"
    case addMyLocationTitle = "addMyLocationTitle"
    
    var tableName: String? {
        return "Localizable"
    }
}
