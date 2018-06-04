//
//  Constants.swift
//  PMP
//
//  Created by tcui on 9/3/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    static var remoteConstantDidChange: NSNotification.Name { return NSNotification.Name(rawValue: "remoteConstantDidChange") }
    static var readModeDidChange: NSNotification.Name { return NSNotification.Name(rawValue: "readModeDidChange") }
    static var fontSizeDidChange: NSNotification.Name { return NSNotification.Name(rawValue: "fontSizeDidChange") }
    static var bookmarksDidChange: NSNotification.Name { return NSNotification.Name(rawValue: "bookmarksDidChange") }
}
