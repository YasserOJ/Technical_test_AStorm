//
//  UIViewControllerExtension.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import Foundation
import UIKit

let defaultReferenceScreenWidth: CGFloat = (UIDevice().userInterfaceIdiom == .pad) ? 600 : 375.0

enum AppStoryboard: String {
    case splashScreen = "SplashScreenStoryBoard"
    case weatherOverview = "WeatherOverview"
    case cityWeatherDetail = "CityWeatherDetail"
    case addCity = "AddCityViewControllerStoryBoard"
}

extension UIViewController {
    
    func push(viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }

    func popToRootViewController() {
        self.navigationController?.popToRootViewController(animated: false)
    }

    func popWithCompletion(animated: Bool = true, completion: @escaping () -> Void) {
        self.navigationController?.popViewController(animated: animated)

        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }

    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let viewC = self.navigationController?.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            self.navigationController?.popToViewController(viewC, animated: animated)
        }
    }

    class func instantiate<ViewController: UIViewController>(appStoryboardName: AppStoryboard) -> ViewController {

        let storyboard = UIStoryboard(name: appStoryboardName.rawValue, bundle: nil)
        let identifier = String(describing: self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        as? ViewController else {
            return ViewController()
        }
        return viewController
    }

    class func instantiate<ViewController: UIViewController>(xibName: String? = nil) -> ViewController {
        return ViewController(nibName: xibName ?? String(describing: self), bundle: Bundle(for: self))
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

    func addViewController(targetView: UIView, targetViewController: UIViewController?) {
        if let viewController = targetViewController {
            addChild(viewController)
            viewController.willMove(toParent: self)
            viewController.view.frame = targetView.bounds
            targetView.addSubview(viewController.view)
            viewController.didMove(toParent: self)
        }
    }

    func removeViewController(_ viewController: UIViewController?) {
        if let removedViewController = viewController {
            removedViewController.view.layer.removeAllAnimations()
            removedViewController.willMove(toParent: nil)
            removedViewController.view.removeFromSuperview()
            removedViewController.removeFromParent()
        }
    }

    @objc func sz_viewDidLoad() {

        view.callRecursively { subview, _ in
            for constraint in subview.constraints {
                let screenWidthFactor = 1 / defaultReferenceScreenWidth
                constraint.constant = constraint.constant * UIScreen.main.bounds.width * screenWidthFactor
            }
        }
    }

    private static let swizzleDesriptionImplementation: Void = {
        let aClass: AnyClass! = object_getClass(UIViewController())
        let originalMethod = class_getInstanceMethod(aClass, #selector(viewDidLoad))
        let swizzledMethod = class_getInstanceMethod(aClass, #selector(sz_viewDidLoad))
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }()

    static func swizzleLayoutConstraint() {
        _ = self.swizzleDesriptionImplementation
    }
}
