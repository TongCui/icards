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

        loadNotebooks()
    }
    
    func loadNotebooks() {
        Requests.notebooks.alamofire.responseModel(type: DefaultResponse<[NotebookCatalog]>.self) {[weak self] (response) in
            if let models = response.result.value?.model {
                self?.update(notebooks: models)
            } else {
                print("Notebooks error")
            }
        }
    }
    
    func update(notebooks: [NotebookCatalog]) {
        guard let notebookCatalog = notebooks.last else {
            return
        }
        
        Requests.notebook(name: notebookCatalog.name).alamofire.responseModel(type: DefaultResponse<Notebook>.self) { [weak self] (response) in
            if let notebook = response.result.value?.model {
                self?.update(notebook: notebook)
            } else {
                print("Notebook error")
            }
        }
    }
    
    func update(notebook: Notebook) {
        let notes = notebook.groupedNotes.sorted { (lhs, rhs) -> Bool in
            lhs.key > rhs.key
        }
        
        notes.forEach { (pair) in
            let cellItems = pair.value.map { self.cellItem(with: $0) }
            append(section: TitleHeaderSectionItem(header: pair.key)) { cellItems }
        }
        
        reloadData()
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
