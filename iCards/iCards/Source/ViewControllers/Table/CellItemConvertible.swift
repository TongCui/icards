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

extension Note: CellItemConvertible {
    func toCellItem() -> CellItemProtocol {
        return CardCellItem(note: self)
    }
}
