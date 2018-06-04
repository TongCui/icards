//
//  FirebaseCloudMessageExtensions.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

extension Messaging {
    class func configure(application: UIApplication, appDelegate: AppDelegate) {
        UNUserNotificationCenter.current().delegate = appDelegate

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = appDelegate
    }
}

extension AppDelegate: MessagingDelegate, UNUserNotificationCenterDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        log.info("Get token: \(fcmToken)")
    }
}

extension AppDelegate {

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {

        // Print full message.
        print(userInfo)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        // Print full message.
        print(userInfo)

        completionHandler(UIBackgroundFetchResult.newData)
    }
}
