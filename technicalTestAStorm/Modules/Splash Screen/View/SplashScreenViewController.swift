//
//  SplashScreenViewController.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    let splashScreenViewModel = SplashScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        splashScreenViewModel.getCities()
        
    }
    

}
