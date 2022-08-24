//
//  AppManager.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 24/8/2022.
//

import Foundation

class AppManager {
    static let shared = AppManager()
    
    
    var userCitiesWeather : [WeatherResponseModel] = []
    
    var cities : [String] = []
}
