//
//  ReviewCardsViewController.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit

final class ReviewCardsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var adapter = CardsAdapter(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.reloadData()
    }

}
