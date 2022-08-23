//
//  UIViewExtension.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import UIKit

extension UIView {

    /**
     Setting, Getting  the cornerRadius of the UIView
     */

    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }

    /**
     Returns a `UIView` object instantiated from nib
     */
    func instantiateFromNib() -> UIView? {
        let nib = UINib(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
    /**
     * Load the content of the first view in the XIB.
     * Then add this as subview with constraints
     */

    func loadNibContent() {
        guard let view = instantiateFromNib() else {
            fatalError("Failed to instantiate \(String(describing: Self.self)).xib")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        let views = ["view": view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|",
                                                                 options: .alignAllLastBaseline,
                                                                 metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|",
                                                                   options: .alignAllLastBaseline,
                                                                   metrics: nil, views: views)
        addConstraints(verticalConstraints + horizontalConstraints)
    }


    func callRecursively(level: Int = 0, _ body: (_ subview: UIView, _ level: Int) -> Void) {
        body(self, level)
        subviews.forEach { $0.callRecursively(level: level + 1, body) }
    }
}
