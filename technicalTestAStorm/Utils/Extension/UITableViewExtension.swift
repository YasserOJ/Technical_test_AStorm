//
//  UITableView.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 24/8/2022.
//

import UIKit

public extension UITableView {

    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
