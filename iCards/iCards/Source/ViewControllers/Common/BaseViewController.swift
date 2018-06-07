//
//  BaseViewController.swift
//  PMP
//
//  Created by tcui on 27/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import Crashlytics
import quickswift

class BaseViewController: LifeCycleManagedViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        let vcName = type(of: self).typeName
//        let id = vcName.replacingOccurrences(of: "ViewController", with: "").lowercased()
//        Answers.logContentView(withName: vcName, contentType: "vc-appear", contentId: id,  customAttributes: ["title": navigationItem.title ?? "none"])
    }

}
