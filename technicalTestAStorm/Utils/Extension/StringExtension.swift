//
//  StringExtension.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 24/8/2022.
//

import Foundation
extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
