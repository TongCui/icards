//
//  FirebaseAuthExtensions.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

extension AppDelegate: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let result = authDataResult {
            log.info("Got token - \(result)")
        }
    }
}

extension FUIAuth {
    class func configure(appDelegate: AppDelegate) {
        if let authUI = FUIAuth.defaultAuthUI() {
            authUI.delegate = appDelegate
            let providers: [FUIAuthProvider] = [
                FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!)
            ]
            authUI.providers = providers
        }
    }
}

extension AppDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?

        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }

        return false
    }
}
