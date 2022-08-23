//
//  WeatherApiEndPoint.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation


enum WeatherApi : EndPointType{
    
    case addLocationByLatitude(_ lat: Double, andLongitude: Double)
    case addLocationByCityName(_ cityName: String)
    var url: String {
        var path = "?appid=\(ApiClient.appID())&units=metrics&"
        switch self {

        case .addLocationByLatitude(_: let latitude, andLongitude: let andLongitude):
            path += "lat=\(latitude)&lon=\(andLongitude)"
        case .addLocationByCityName(_: let cityName):
            path += "q=\(cityName)"
        }
        return ApiClient.baseURL() + path
    }
    
    var method: String {
        switch self {
            
        case .addLocationByLatitude:
            return "GET"
        case .addLocationByCityName:
            return "GET"
        }
    }
    
    var parameters: [String : Any?] {
        switch self {
        case .addLocationByLatitude, .addLocationByCityName:
            return [:]
        }
    }
    
    
}
