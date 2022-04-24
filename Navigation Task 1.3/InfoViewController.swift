//
//  InfoViewController.swift
//  Navigation Task 1.3
//
//  Created by Vasilisa on 19.04.2022.
//

import UIKit

class InfoViewController: UIViewController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexStringToUIColor(hex: "#f8a5c2")

        self.navigationItem.title = "Tip"

        setupButton()

        let height: CGFloat = 75
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
        navbar.backgroundColor = hexStringToUIColor(hex: "#f8a5c2")
        navbar.delegate = self

        let navItem = UINavigationItem()
        navItem.title = "Edit Post"
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(closeWindow))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(closeWindow))

        navbar.items = [navItem]

        view.addSubview(navbar)

    }

    @objc func closeWindow(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitle("Delete Post", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setupButton() {
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc private func buttonAction() {

        let alert = UIAlertController(title: "Delete the post?", message: "This action cannot be undone", preferredStyle: .alert)

        let actionPositive = UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            print("The post remained")
        })

        let actionNegative = UIAlertAction(title: "Delete forever", style: .destructive, handler: { (action) in
            print("The post is deleted")
            self.dismiss(animated: true, completion: nil)
        })

        alert.addAction(actionPositive)
        alert.addAction(actionNegative)
        self.present(alert, animated: true, completion: nil)
    }
}
