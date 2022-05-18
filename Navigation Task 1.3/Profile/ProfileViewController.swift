//
//  ProfileViewController.swift
//  Navigation Task 1.3
//
//  Created by Vasilisa on 15.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    lazy var userProfileView: ProfileHeaderView = {
        let userProfileView = ProfileHeaderView()
        return userProfileView
    }()

    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 12
        button.setTitle("New button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3

        view.addSubview(userProfileView)
        userProfileView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userProfileView.heightAnchor.constraint(equalToConstant: 220),
            userProfileView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            userProfileView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),

            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}
