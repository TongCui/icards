//
//  UsagePath.swift
//  PMP
//
//  Created by tcui on 23/3/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

protocol UsagePathRecording where Self: UIViewController {
    func usagePath() -> UsagePath
    func usagePathRestore(last: UsagePath, current: UsagePath)
}

protocol UsagePath: Codable {
    var pathName: String { get }
    var info: [String: String]? { get set}
}

extension UsagePath {
    func infoValue<T>(key: String, convert: (String) -> T? ) -> T? {
        guard let valueStr = info?[key] else {
            return nil
        }

        return convert(valueStr)
    }
}

struct VCUsagePath: UsagePath {
    var pathName: String
    var info: [String: String]?

    var scrollViewContentOffset: CGFloat?

    init(vc: UIViewController) {
        pathName = "\(type(of: vc))-\(vc.title ?? "None")"

        if let scrollView = vc.view as? UIScrollView {
            scrollViewContentOffset = scrollView.contentOffset.y
        }
    }
}

struct NavigationUsagePath: UsagePath {
    var pathName: String
    var info: [String: String]?

    var vcUsagePaths: [VCUsagePath] = []

    init(navigation: UINavigationController) {
        pathName = "Navigation"

//        vcUsagePaths = navigation.viewControllers.map { VCUsagePath(vc: $0) }
    }
}

struct TabUsagePath: UsagePath {
    var pathName: String
    var info: [String: String]?

    var vcUsagePaths: [VCUsagePath] = []

    init(tabController: UITabBarController) {
        pathName = "Navigation"

//        vcUsagePaths = navigation.viewControllers.map { VCUsagePath(vc: $0) }
    }
}
