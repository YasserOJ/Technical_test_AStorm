//
//  WeatherApiManager.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation

class WeatherApiManager {
    
    func addLocation(lat: Double, lng: Double , completion: @escaping ((GenericResult<WeatherResponseModel>) -> ()) )  {
        HTTPTask.request(endPointType: WeatherApi.addLocationByLatitude(lat, andLongitude: lng), completion: completion)
    }
    
    func addLocation(cityName: String , completion: @escaping ((GenericResult<WeatherResponseModel>) -> ()) )  {
        HTTPTask.request(endPointType: WeatherApi.addLocationByCityName(cityName), completion: completion)
    }

}
