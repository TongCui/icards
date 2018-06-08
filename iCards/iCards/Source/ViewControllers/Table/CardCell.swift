//
//  CardCell.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift
import MarkdownView
import SDWebImage

class CardCellItem: CellItemProtocol {

    var registerType: TableViewRegisterType = .class(CardCell.self)
    var identifier: String = "card_cell"
    var cellConfigurator = CellConfigurator()
    var actionHandler = CellActionHandler()
    var cellDisplayingContext = CellItemDisplayingContext()

    let note: Note

    init(note: Note) {
        self.note = note
        cellConfigurator.cellHeight = .cardHeight
    }

    func bind(cell: UITableViewCell) {
        if let cell = cell as? CardCell {
            cell.markdownView.load(markdown: note.content, enableImage: false)
        }
    }

}

class CardCell: UITableViewCell {

    lazy var cardView = UIView()
    lazy var markdownView = MarkdownView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        selectionStyle = .none
        contentView.addSubview(cardView)
        cardView.addSubview(markdownView)

        markdownView.isUserInteractionEnabled = false
        markdownView.isScrollEnabled = false

        cardView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: .defaultMargin, left: .cardMargin, bottom: .defaultMargin, right: .cardMargin))
        }

        markdownView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        setupCardView()
    }

    private func setupCardView() {
        cardView.backgroundColor = .white
        cardView.clipsToBounds = true
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = 0.5
        cardView.layer.cornerRadius = .cardRadius
    }
}
