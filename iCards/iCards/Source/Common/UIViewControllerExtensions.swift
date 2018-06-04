//
//  UIViewControllerExtensions.swift
//  PMP
//
//  Created by tcui on 11/3/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit

extension UIViewController {
    func performSegue(segue: SegueId) {
        performSegue(withIdentifier: segue.rawValue, sender: nil)
    }

    func performSegue<T>(segue: SegueId, context action : @escaping (T) -> Void) {
        performSegue(for: segue.rawValue, context: action)
    }

    func setLargetTitles(_ enabled: Bool) {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = enabled
        }
    }
}
