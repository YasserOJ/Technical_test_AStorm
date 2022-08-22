//
//  ApiClient.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation

class ApiClient: NSObject {

    class func baseURL() -> String {
        return self.serverParameters().baseURL
    }

    class func appID() -> String {
        return self.serverParameters().apiKey
    }

    fileprivate class func serverParameters() -> ServerParameters {

        #if TEST_ENV_DEV
        return ServerParameters.devParameters
        #else
        fatalError("The environment is not specified")
        #endif
    }

}
