//
//  SettingsViewController.swift
//  PMP
//
//  Created by tcui on 11/3/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import quickswift
import MessageUI

final class SettingsAdapter: PMPAdapter {

}

final class SettingsViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var adapter = SettingsAdapter(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        adapter.reloadData()
    }

}
