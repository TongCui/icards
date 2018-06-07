//
//  CardsViewController.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

final class CardsAdapter : ProjectBaseAdapter {
    required init() {
        super.init()
        
        let cards: [Card] = (0..<10).map { (idx) in
            let image = idx % 2 == 0 ? "https://raw.githubusercontent.com/TongCui/quickswift/master/quickswift-icon.png" : nil
            let type = idx % 2 == 0 ? "image" : "text"
            let content = "This is a content".repeat(30)
            return Card(title: "Title Card \(idx)", image: image, content: content, type: type, createTime: Date(), updateTime: Date().addingTimeInterval(3600))
        }
        
        append(section: TitleHeaderSectionItem(header: "Test")) { () -> [CellItemProtocol] in
            cards.map { $0.toCellItem() }
        }
    }
}

final class CardsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var adapter = CardsAdapter(tableView: tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.reloadData()
    }

}
