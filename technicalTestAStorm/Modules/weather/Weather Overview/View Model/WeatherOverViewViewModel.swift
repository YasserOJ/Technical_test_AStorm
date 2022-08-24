//
//  WeatherOverViewViewModel.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import Foundation

class WeatherOverViewViewModel {
    
    var hasCities: Bool {return !AppManager.shared.userCitiesWeather.isEmpty}
    var citiesWeather: [WeatherResponseModel] {return AppManager.shared.userCitiesWeather}
    
}
