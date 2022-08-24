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
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        setupConstraints()
        
        return true
    }


    func setupConstraints() {
        UIViewController.swizzleLayoutConstraint()
    }
}

