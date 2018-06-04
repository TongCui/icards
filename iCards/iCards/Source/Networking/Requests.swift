//
//  Requests.swift
//  TopwinRestaurants
//
//  Created by tcui on 17/1/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

enum Requests: RequestModelConvertible {

    var host: String { return "http://115.28.178.25" }

    case constant
    case news

    func toRequestModel() -> RequestModel {
        switch self {
        case .constant:     return RequestModel(.get, .http, host, "/pmpjson/constants_v\(version()).json")
        case .news:         return RequestModel(.get, .http, host, "/pmp/news.json")
        }
    }

    func version() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        return version
    }
}

struct DefaultResponse<T: Codable> : Codable {
    var model: T?

    enum CodingKeys: String, CodingKey {
        case model = "data"
    }
}
