//
//  NotesViewController.swift
//  iCards
//
//  Created by tcui on 4/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import quickswift

final class NotesAdapter: ProjectBaseAdapter {
    required init() {
        super.init()

        if  let notebookCatalog = NotebookDatasource.shared.notebookCatalogs().last,
            let notebook = notebookCatalog.notebook {
            
            let notes = notebook.groupedNotes.sorted { (lhs, rhs) -> Bool in
                lhs.key > rhs.key
            }
            
            notes.forEach { (pair) in
                let cellItems = pair.value.map { self.cellItem(with: $0) }
                append(section: TitleHeaderSectionItem(header: pair.key)) { cellItems }
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

final class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    lazy var adapter = NotesAdapter(tableView: tableView)

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
