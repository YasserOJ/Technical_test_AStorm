//
//  GenericErrorModel.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import Foundation

public class GenericErrorModel: Codable {

    // MARK: Properties
    public var message: String?
    public var code: String?

    enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
    }
    init() {
    }

    init(message: String?, code: String?) {
        self.message = message
        self.code = code
    }
    func provideError() -> Error {
        return NSError(domain: self.message ?? "", code: Int(self.code ?? "0") ?? 0, userInfo: nil)
    }
}
