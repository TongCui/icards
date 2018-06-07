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


class BaseCardCellItem: CellItemProtocol {
    
    var registerType: TableViewRegisterType
    var identifier: String = "card_cell"
    var cellConfigurator = CellConfigurator()
    var actionHandler = CellActionHandler()
    var cellDisplayingContext = CellItemDisplayingContext()
    
    init(card: Card) {
        switch card.cardType {
        case .text:
            registerType = .class(TextCardCell.self)
        case .image:
            registerType = .class(ImageCardCell.self)
        }
        
        cellConfigurator.cellHeight = 400
    }
    
    func bind(cell: UITableViewCell) {
        if let _ = cell as? BaseCardCell {
            print("bind cell")
            
            
            
//            let markdown = """
//            # Title
//            ## Subtitle
//            ![Minion](https://raw.githubusercontent.com/TongCui/quickswift/master/quickswift-icon.png)
//            Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content
//            #### footer
//            """
//
//            cell.markdownView.load(markdown: markdown, enableImage: true)

//            cell.markdownView.isScrollEnabled = false
        }
    }
    
}

final class TextCardCellItem: BaseCardCellItem {
    
}

final class ImageCardCellItem: BaseCardCellItem {
    
}


class BaseCardCell: UITableViewCell {
    lazy var cardContentView = UIView()
    lazy var cardView = UIView()
    lazy var titleLabel = UILabel()
    
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
        contentView.backgroundColor = .clear
        
        contentView.addSubview(cardContentView)
        cardContentView.addSubview(cardView)
        
        cardContentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: .cardMargin, left: .cardMargin, bottom: .cardMargin, right: .cardMargin))
        }
        cardView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        setupCardView()
    }
    
    private func setupCardView() {
        
        cardContentView.backgroundColor = .clear
        cardContentView.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        cardContentView.layer.shadowRadius = .cardShadowRadius
        cardContentView.layer.shadowOpacity = 0.8
        cardContentView.layer.shadowOffset = CGSize(width: 0, height: .cardShadowRadius)
        
        cardView.backgroundColor = .white
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = .cardRadius
        
    }
}


final class ImageCardCell: BaseCardCell {
    lazy var contentImageView = UIImageView()
    lazy var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    override func commonInit() {
        super.commonInit()
        
        cardView.addSubview(contentImageView)
        cardView.addSubview(visualEffectView)
        visualEffectView.contentView.addSubview(titleLabel)
        
        imageView?.sd_setImage(with: URL(fileURLWithPath: "https://raw.githubusercontent.com/TongCui/quickswift/master/quickswift-icon.png"))
        titleLabel.text = "Title Label"
        
    }
}


final class TextCardCell: BaseCardCell {
    lazy var contentLabel = UILabel()
    
    override func commonInit() {
        super.commonInit()
        
        cardView.addSubview(titleLabel)
        cardView.addSubview(contentLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().offset(CGFloat.defaultMargin)
            make.top.equalToSuperview().offset(CGFloat.cardMargin)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().offset(CGFloat.defaultMargin)
        }
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        titleLabel.text = "Text Label"
        contentLabel.text = "Content Label".repeat(40)
    }
}

