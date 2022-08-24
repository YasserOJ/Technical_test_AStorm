//
//  AddCityViewModel.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import Foundation
import CoreLocation


class AddCityViewModel {
    
    let weatherApiManager = WeatherApiManager()
    
    var didAddLocationWithSuccess : () -> Void = {}
    var didFailedCityAdd: (GenericErrorModel) -> Void = {_ in }
    
    
    func getCityWithMyLocaion(location: CLLocation) {
        weatherApiManager.addLocation(lat: location.coordinate.latitude, lng: location.coordinate.longitude) { result in
            switch result {
            case .success(let cityWeather):
                if let cityWeather = cityWeather {
                    AppManager.shared.userCitiesWeather.append(cityWeather)
                    if let name = cityWeather.name {
                        AppManager.shared.cities.append(name)
                    }
                }
                self.didAddLocationWithSuccess()
            case .failure(let error):
                self.didFailedCityAdd(error)
            }
        }
    }
    
    func getCityWeather(cityName: String){
        weatherApiManager.addLocation(cityName: cityName) { [unowned self] result in
            switch result {
            case .success(let cityWeather):
                if let cityWeather = cityWeather {
                    AppManager.shared.userCitiesWeather.append(cityWeather)
                    if let name = cityWeather.name {
                        AppManager.shared.cities.append(name)
                    }
                    saveCities(allObjects: AppManager.shared.cities)
                    saveWeathers(allObjects: AppManager.shared.userCitiesWeather)
                }
                self.didAddLocationWithSuccess()
            case .failure(let error):
                self.didFailedCityAdd(error)
            }
        }
    }
    
    func saveCities(allObjects: [String]) {
            UserDefaults.standard.set(allObjects, forKey: "SavedCities")
    }
    
    func saveWeathers(allObjects: [WeatherResponseModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allObjects){
           UserDefaults.standard.set(encoded, forKey: "citiesWeather")
        }
    }
}
