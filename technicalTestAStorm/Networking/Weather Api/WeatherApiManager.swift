//
//  WeatherApiManager.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation

class WeatherApiManager {
    
    func addLocation(lat: Double, lng: Double , completion: @escaping ((Result<Int,Error>) -> ()) )  {
        HTTPTask.request(endPointType: WeatherApi.addLocation(lat: lat, lng: lng), completion: completion)
    }
}
