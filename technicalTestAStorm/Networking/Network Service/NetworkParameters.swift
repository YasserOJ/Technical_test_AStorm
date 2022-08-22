//
//  NetworkParameters.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation


struct ServerParameters {
    let baseURL: String
    let apiKey: String
    static let devParameters: ServerParameters = ServerParameters(
        baseURL: "https://api.openweathermap.org/data/2.5/onecall",
        apiKey: "0ae6735afdc6f99d7af23db5d1bd1fbe"
    )
    
    static var  headers: [String: String]? = [:]
}
