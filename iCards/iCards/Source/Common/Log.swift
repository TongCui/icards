//
//  Log.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

import SwiftyBeaver

let log: SwiftyBeaver.Type = {
    let log = SwiftyBeaver.self
    let console = ConsoleDestination()  // log to Xcode Console
    console.minLevel = .verbose
    log.addDestination(console)
    return log
}()
