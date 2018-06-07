//
//  ProjectBaseAdapter.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//


import quickswift

class ProjectBaseAdapter: HeaderFooterTableAdapter, TypeName {
    public static var typeName: String {
        let type = String(describing: self)
        return type
    }
}
