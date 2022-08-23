//
//  LocationGeoCoder.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import Foundation
import MapKit

class LocationGeoCoder {
    static func getCityNameFrom(lat: Double, lng: Double, complition: @escaping ((String?) ->())) {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: lat, longitude: lng)) { places, error in
            if let places = places, places.count > 0 {
                let place = places.first
                complition(place?.locality)
            }
            complition(nil)
        }
    }
    
    static func getLocationFrom(cityName: String, complition: @escaping ((Double?, Double?) ->())){
        CLGeocoder().geocodeAddressString(cityName) { places, error in
            if let places = places, places.count > 0 {
                let place = places.first
                complition(place?.location?.coordinate.latitude, place?.location?.coordinate.longitude)
            }
            complition(nil, nil)
        }
    }
    
}
