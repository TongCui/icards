//
//  Requests.swift
//  TopwinRestaurants
//
//  Created by tcui on 17/1/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

enum Requests: RequestModelConvertible {
//raw.githubusercontent.com/TongCui/icards/master/notebooks/
    var host: String { return "https://raw.githubusercontent.com" }

    case notebooks
    case notebook(name: String)

    func toRequestModel() -> RequestModel {
        switch self {
        case .notebooks:
            return RequestModel(.get, .https, host, "/TongCui/icards/master/notebooks/notebooks.json")
        case .notebook(let name):
            return RequestModel(.get, .https, host, "/TongCui/icards/master/notebooks/notebook_\(name).json")
        }
    }

}

struct DefaultResponse<T: Codable> : Codable {
    var model: T?

    enum CodingKeys: String, CodingKey {
        case model = "data"
    }
}
