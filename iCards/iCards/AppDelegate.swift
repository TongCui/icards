//
//  AppDelegate.swift
//  iCards
//
//  Created by tcui on 23/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseMessaging
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        Messaging.configure(application: application, appDelegate: self)
        FUIAuth.configure(appDelegate: self)

        return true
    }

}
