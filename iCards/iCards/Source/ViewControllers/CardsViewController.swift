//
//  CardsViewController.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

final class CardsAdapter: ProjectBaseAdapter {
    required init() {
        super.init()

        if  let notebookCatalog = NotebookDatasource.shared.notebookCatalogs().last,
            let notebook = notebookCatalog.notebook {
            append(section: PlainSectionItem()) {
                notebook.notes.map { note in
                    self.cellItem(with: note)
                }
            }
        }

    }

    func cellItem(with note: Note) -> CellItemProtocol {
        let cellItem = note.toCellItem()
        cellItem.add(action: .cellDidSelect) { (params) in
            self.parentViewController()?.performSegue(segue: .card) { (vc: NoteViewController) in
                vc.note = note
            }
        }
        return cellItem
    }
}

final class CardsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    lazy var adapter = CardsAdapter(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        prepareWithSegueContext(for: segue, sender: sender)
    }

}
