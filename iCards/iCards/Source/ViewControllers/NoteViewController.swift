//
//  NoteViewController.swift
//  iCards
//
//  Created by tcui on 8/6/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import MarkdownView

final class NoteViewController: UIViewController {

    @IBOutlet weak var markdownView: MarkdownView!
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = note?.title
        markdownView.load(markdown: note?.content, enableImage: true)
    }

}
