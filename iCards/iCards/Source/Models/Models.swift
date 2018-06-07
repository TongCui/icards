//
//  Models.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

protocol RecordItem {
    var createTime: Date { get set }
    var updateTime: Date { get set }
}

fileprivate let recordFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
}()

extension Date {
    func toS() -> String {
        return recordFormatter.string(from: self)
    }
}

extension RecordItem {
    static func decodeSettings() -> (JSONDecoder) -> Void {
        return { decoder in
            decoder.dateDecodingStrategy = .formatted(recordFormatter)
        }
    }
    
    static func encodeSettings() -> (JSONEncoder) -> Void {
        return { encoder in
            encoder.dateEncodingStrategy = .formatted(recordFormatter)
        }
    }
}

struct Card: Codable, CustomCodable, RecordItem {
    
    enum CardType: String {
        case text
        case image
    }
    
    var title: String
    var image: String?
    var content: String?
    var type: String
   
    var createTime: Date
    var updateTime: Date
    
    var cardType: CardType {
        return CardType(rawValue: type) ?? .text
    }
}

struct Note: Codable {
    var markdown: String
}

struct Notebook: Codable, CustomCodable, RecordItem {
    var name: String
    var icon: String
    
    var createTime: Date
    var updateTime: Date
}
