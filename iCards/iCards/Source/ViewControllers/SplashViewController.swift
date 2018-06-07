//
//  SplashViewController.swift
//  iCards
//
//  Created by tcui on 28/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit

final class SplashViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        test()
    }
    
    func test() {
//        let note = Note(name: "test", createTime: Date(), updateTime: Date().addingTimeInterval(3600))
//        let string = try! note.toJSONString()
//        
//        let newNote = try! Note(fromJSONString: string)
//        
//        print(newNote.createTime.toS())
//        print(newNote.updateTime.toS())
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.performSegue(segue: .main)
        }
    }
}
