//
//  Models.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

private let recordFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

extension Date {
    func toS() -> String {
        return recordFormatter.string(from: self)
    }
}

struct Note: Codable {

    enum CardType: String {
        case text
        case image
    }

    var title: String
    var from: String
    var create: String
    var update: String
    var tags: String
    var type: String?
    var image: String?
    var content: String?

    var tagComponents: [String] {
        return tags.components(separatedBy: CharacterSet(charactersIn: ",，|"))
    }

    var cardType: CardType {
        guard let type = self.type else {
            return .text
        }
        return CardType(rawValue: type) ?? .text
    }

}

struct NotebookCatalog: Codable {
    var name: String
    var count: Int
}

//extension NotebookCatalog {
//    var notebook: Notebook? {
//        return NotebookDatasource.shared.notebook(with: name)
//    }
//}

struct Notebook: Codable {
    var name: String
    var notes: [Note]
    
    var groupedNotes: [String: [Note]] {
        return notes.group { note in note.create }
    }
}
