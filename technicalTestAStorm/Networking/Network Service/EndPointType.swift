//
//  EndPointType.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import UIKit
import Foundation

protocol  EndPointType {

    var url: String { get}

    var method: String { get}

    var parameters: [String: Any?] {get}

    var additionalHeader: [String: String]? {get}

    var shouldShowErrorAlerts: Bool { get }

}
extension EndPointType {

    var additionalHeader: [String: String]? {
        return ServerParameters.headers

    }

    var shouldShowErrorAlerts: Bool {
        return true
    }
}
