//
//  PostViewController.swift
//  Navigation Task 1.3
//
//  Created by Vasilisa on 19.04.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexStringToUIColor(hex: "#f5cd79")
        navigationItem.title = titlePost

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit Post", style: .plain, target: self, action: #selector(editPost))
    }

    @objc func editPost(sender: AnyObject) {
        self.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.modalPresentationStyle = .currentContext
        self.present(InfoViewController(), animated: true, completion: nil)
    }

}
