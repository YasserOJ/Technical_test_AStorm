//
//  AppDelegate.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = SplashScreenViewController.instantiate(appStoryboardName: "SplashScreenStoryBoard")
        let navigationController = UINavigationController(rootViewController: initialViewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        setupConstraints()
        
        return true
    }


    func setupConstraints() {
        UIViewController.swizzleLayoutConstraint()
    }
}

