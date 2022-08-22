//
//  WeatherApiEndPoint.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation


enum WeatherApi : EndPointType{
    
    case addLocation(lat: Double, lng: Double)
    var url: String {
        var path = ""
        switch self {
            
        case .addLocation(lat: let lat, lng: let lng):
            path += "?lat=\(lat)&lon=\(lng)&appid=\(ApiClient.appID())"
        }
        return path

    }
    
    var method: String {
        switch self {
            
        case .addLocation:
            return "GET"
        }
    }
    
    var parameters: [String : Any?] {
        switch self {
        case .addLocation:
            return [:]
        }
    }
    
    
}
