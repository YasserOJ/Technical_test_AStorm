//
//  SplashScreenViewModel.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import Foundation
import UIKit

class SplashScreenViewModel {
    let savedCitiesKey = "SavedCities"
    let weatherManager = WeatherApiManager()
    var citiesWeather : [WeatherResponseModel] = []
    
    func getCities() {
        let cities :[String]? = UserDefaults.standard.object(forKey: savedCitiesKey) as? [String]
        if let cities = cities {
            AppManager.shared.cities = cities
            if !cities.isEmpty {
                if #available(iOS 12.0, *) {
                    let network = NetworkMonitor()
                    network.startMonitoring { [unowned self] connected in
                        if connected {
                            self.performGetCities(cities: cities)
                        } else {
                            citiesWeather = getAllObjects
                            AppManager.shared.userCitiesWeather = citiesWeather
                            goToCitiesWeatherOverView()
                        }
                    }
                    network.stopMonitoring()
                } else {
                    self.performGetCities(cities: cities)
                }
            }
        } else {
            goToCitiesWeatherOverView()
        }
    }
    
    func performGetCities(cities: [String]) {
        for i in 0..<cities.count {
            self.weatherManager.addLocation(cityName: cities[i]) { [unowned self]result in
                switch result {
                case .success(let cityWeather):
                    if let cityWeather = cityWeather{
                        self.citiesWeather.append(cityWeather)
                    }
                    if i == cities.count - 1 {
                        AppManager.shared.userCitiesWeather = self.citiesWeather
                        goToCitiesWeatherOverView()
                    }
                case .failure(_):
                    if i == cities.count - 1 {
                        AppManager.shared.userCitiesWeather = self.citiesWeather
                        goToCitiesWeatherOverView()
                    }
                }
            }
        }
    }
    
    var getAllObjects: [WeatherResponseModel] {
        if let objects = UserDefaults.standard.value(forKey: "citiesWeather") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [WeatherResponseModel] {
                return objectsDecoded
            }
        }
        return []
    }
    
    func goToCitiesWeatherOverView(){
        DispatchQueue.main.async {
            let window = UIApplication.shared.windows[0] as UIWindow
            let weatherOverViewController = WeatherOverViewViewController.instantiate(appStoryboardName: "WeatherOverview")
            let navigationController = UINavigationController(rootViewController: weatherOverViewController)
            window.rootViewController = navigationController
        }
    }
}
