//
//  ProfileViewController.swift
//  Navigation Task 1.3
//
//  Created by Vasilisa on 15.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3

    }

    lazy var userProfileView: ProfileHeaderView = {
        let userProfileView = ProfileHeaderView()

        userProfileView.avatarView.image = UIImage(named: "cat")!
        userProfileView.userName.text = "Fluffy cat"
        userProfileView.userStatus.text = "Waiting for something"

        return userProfileView
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupView()

        userProfileView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height);

        userProfileView.userTextInfo.frame = CGRect(
            x: userProfileView.avatarView.frame.size.width + 16,
            y: 27,
            width: userProfileView.frame.size.width - userProfileView.avatarView.frame.size.width - 48,
            height: 120)

        userProfileView.userName.frame = CGRect(
            x: 0,
            y: 0,
            width: userProfileView.userTextInfo.frame.size.width,
            height: 20)

        userProfileView.userStatus.frame = CGRect(
            x: 0,
            y: userProfileView.userName.frame.size.height + 40,
            width: userProfileView.userTextInfo.frame.size.width,
            height: 16)

        userProfileView.button.frame = CGRect(
            x: 0,
            y: userProfileView.avatarView.frame.size.height + 56,
            width: userProfileView.frame.size.width - 32,
            height: 50)

        userProfileView.newStatus.frame = CGRect(
            x: 0,
            y: userProfileView.userName.frame.size.height + 44 + userProfileView.userStatus.frame.size.height,
            width: userProfileView.userTextInfo.frame.size.width,
            height: 40)

    }

    private func setupView() {
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userProfileView)

        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            userProfileView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            userProfileView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
        ])

        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                userProfileView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
                guide.bottomAnchor.constraint(equalToSystemSpacingBelow: userProfileView.bottomAnchor, multiplier: 1.0)
            ])
        } else {
            let standardSpacing: CGFloat = 8.0
            NSLayoutConstraint.activate([
                userProfileView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
                bottomLayoutGuide.topAnchor.constraint(equalTo: userProfileView.bottomAnchor, constant: standardSpacing)
            ])
        }
    }

}
