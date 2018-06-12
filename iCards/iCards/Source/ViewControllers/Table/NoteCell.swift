//
//  NoteCell.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift
import SDWebImage

class NoteCellItem: CellItemProtocol {

    var registerType: TableViewRegisterType = .class(NoteCell.self)
    var identifier: String = "note_cell"
    var cellConfigurator = CellConfigurator()
    var actionHandler = CellActionHandler()
    var cellDisplayingContext = CellItemDisplayingContext()

    let note: Note

    init(note: Note) {
        self.note = note
    }

    func bind(cell: UITableViewCell) {
        if let cell = cell as? NoteCell {
            cell.noteTitle.text = note.title
            cell.noteSubtitle.text = note.from
            cell.noteTagsLabel.text = note.tags
        }
    }

}

class NoteCell: UITableViewCell {

    lazy var noteContentView = UIView()
    lazy var noteTitle = UILabel()
    lazy var noteSubtitle = UILabel()
    lazy var noteTagsLabel = UILabel()
    lazy var noteImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(noteContentView)
        noteContentView.addSubview(noteTitle)
        noteContentView.addSubview(noteSubtitle)
        noteContentView.addSubview(noteTagsLabel)
        
        noteTitle.numberOfLines = 0
        noteSubtitle.numberOfLines = 0
        noteTagsLabel.numberOfLines = 0
        
        noteContentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(margin: .defaultMargin))
        }
        
        noteTitle.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
        }
        
        noteSubtitle.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(noteTitle.snp.bottom).offset(CGFloat.defaultLabelsMargin)
        }
        
        noteTagsLabel.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(noteSubtitle.snp.bottom).offset(CGFloat.defaultLabelsMargin)
        }
        
        noteTitle.setContentHuggingPriority(.required, for: .horizontal)
        noteTagsLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}
