//
//  Style.swift
//  TopwinRestaurants
//
//  Created by tcui on 18/1/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation
import quickswift

extension CGFloat {
    static var defaultMargin: CGFloat { return 8 }
    static var cardMargin: CGFloat { return .defaultMargin * 2 }
}

extension UIColor {
    class var main: UIColor { return UIColor(red: 32, green: 148, blue: 250)! }
}

enum LabelStyles: StyleFactory {
    case title
    case detail

    var styleItem: StyleItem<UILabel> {
        switch self {
        case .title:
            return StyleItem { label in
                label.font = UIFont.systemFont(ofSize: 11)
                label.numberOfLines = 0
            }
        case .detail:
            return StyleItem { label in
                label.font = UIFont.systemFont(ofSize: 8)
                label.numberOfLines = 0
            }
        }
    }
}
