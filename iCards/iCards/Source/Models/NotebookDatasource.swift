//
//  NotebookDatasource.swift
//  iCards
//
//  Created by tcui on 7/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

class NotebookDatasource {
    static let shared = NotebookDatasource()

    func notebookCatalogs() -> [NotebookCatalog] {
        if  let file = Bundle.main.url(forResource: "notebooks", withExtension: "json"),
            let response = try? DefaultResponse<[NotebookCatalog]>(fromFile: file),
            let notebookCatalogs = response.model {
            return notebookCatalogs
        } else {
            log.warning("notebooks json file war broken")
            return []
        }
    }

    func notebook(with name: String) -> Notebook? {
        if  let file = Bundle.main.url(forResource: "notebook_\(name)", withExtension: "json"),
            let response = try? DefaultResponse<Notebook>(fromFile: file),
            let notebook = response.model {

            return notebook
        } else {
            log.warning("notebook_\(name) json file war broken")
            return nil
        }
    }

    private init() {}
}
