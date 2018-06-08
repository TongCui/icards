//
//  CardSegue.swift
//  iCards
//
//  Created by tcui on 8/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit

class CardSegue: UIStoryboardSegue {

    override func perform() {
        let duration: TimeInterval = 1.0
        let fromVC = source
        let toVC = destination

        toVC.view.center = fromVC.view.center
        fromVC.view.superview?.addSubview(toVC.view)

        UIView.transition(from: fromVC.view, to: toVC.view, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve) { (finished) in
            fromVC.navigationController?.pushViewController(toVC, animated: false)
        }
    }
}

class CardUnwindSegue: UIStoryboardSegue {

    override func perform() {
        let duration: TimeInterval = 1.0
        let fromVC = source
        let toVC = destination

        toVC.view.center = fromVC.view.center
        fromVC.view.superview?.addSubview(toVC.view)

        UIView.transition(from: fromVC.view, to: toVC.view, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve) { (finished) in
            fromVC.navigationController?.popViewController(animated: false)
        }
    }
}
