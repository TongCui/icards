//
//  Services.swift
//  PMP
//
//  Created by tcui on 8/3/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation
import Alamofire
import quickswift

extension JSON {
    public static func parse<T>(fromData data: Data, handler: (Data) -> Data) throws -> T {
        return try parse(fromData: handler(data))
    }
}

class Services {
    static let sharedInstance = Services()
    var lastUpdateDate: Date?

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: .UIApplicationWillEnterForeground, object: nil)
    }

    @objc
    func applicationWillEnterForeground() {
        refreshConstant()
    }

    func refreshConstant() {
        if let date = lastUpdateDate, Date().timeIntervalSince(date) < 300 {
            return
        }
    }
}
