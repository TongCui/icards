//
//  ViewController.swift
//  iCards
//
//  Created by tcui on 23/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
import quickswift
import FirebaseAuth

class ViewController: UIViewController {
    let collection = "sample"

    override func viewDidLoad() {
        super.viewDidLoad()

        var button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 40)
        button.setTitle("Test", for: .normal)
        button.addHandler(for: .touchUpInside) {[unowned self] _ in
            if let authUI = FUIAuth.defaultAuthUI() {
                let phoneProvider = authUI.providers.first as! FUIPhoneAuth
                phoneProvider.signIn(withPresenting: self, phoneNumber: nil)
            }
        }
        self.view.addSubview(button)

        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 100, y: 300, width: 100, height: 40)
        button.setTitle("DB", for: .normal)
        button.addHandler(for: .touchUpInside) { [unowned self] _ in
            let db = Firestore.firestore()
            let settings = db.settings
            settings.areTimestampsInSnapshotsEnabled = true
            db.settings = settings
            var ref: DocumentReference? = nil
            ref = db.collection(self.collection).addDocument(data: [
                "first": "Ada",
                "last": "Lovelace",
                "born": 1815
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }

            ref = db.collection(self.collection).addDocument(data: [
                "first": "Alan",
                "middle": "Mathison",
                "last": "Turing",
                "born": 1912
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
        self.view.addSubview(button)

        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 100, y: 600, width: 100, height: 40)
        button.setTitle("Show", for: .normal)
        button.addHandler(for: .touchUpInside) { [unowned self] _ in
            let db = Firestore.firestore()
            db.collection(self.collection).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
        }
        self.view.addSubview(button)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let user = Auth.auth().currentUser {
            print(user)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
