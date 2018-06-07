//
//  CellItemConvertible.swift
//  iCards
//
//  Created by tcui on 5/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

protocol CellItemConvertible {
    func toCellItem() -> CellItemProtocol
}

extension Card: CellItemConvertible {
    func toCellItem() -> CellItemProtocol {
        switch cardType {
        case .text:     return TextCardCellItem(card: self)
        case .image:    return ImageCardCellItem(card: self)
        }
    }
}
