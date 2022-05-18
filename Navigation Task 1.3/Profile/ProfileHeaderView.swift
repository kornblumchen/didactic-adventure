//
//  ProfileHeaderView.swift
//  Navigation Task 1.3
//
//  Created by Vasilisa on 21.04.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarView: UIImageView = {
        let avatar = UIImageView()
        avatar.backgroundColor = .white
        avatar.image = UIImage(named: "cat")!
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3.0
        avatar.layer.cornerRadius = 55
        avatar.layer.masksToBounds = true
        return avatar
    }()

    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18.0)
        userName.text = "Default user name"
        return userName
    }()

    private lazy var userStatus: UILabel = {
        let userStatus = UILabel()
        userStatus.textColor = .gray
        userStatus.font = UIFont.systemFont(ofSize: 14.0)
        userStatus.text = "Default user status"
        return userStatus
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var newStatus: UITextField = {
        let newStatus = UITextField()
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 12
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.layer.borderWidth = 1.0
        newStatus.textColor = .black
        newStatus.font = UIFont.systemFont(ofSize: 15.0)
        newStatus.setLeftPaddingPoints(10)
        newStatus.setRightPaddingPoints(10)
        newStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return newStatus
    }()

    private lazy var statusText: String = " "


    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(avatarView)
        avatarView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userStatus)
        userStatus.translatesAutoresizingMaskIntoConstraints = false

        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        addSubview(newStatus)
        newStatus.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarView.topAnchor.constraint(equalTo: topAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 110),
            avatarView.heightAnchor.constraint(equalToConstant: 110),

            userName.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor),

            userStatus.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            userStatus.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 40),
            userStatus.trailingAnchor.constraint(equalTo: trailingAnchor),

            newStatus.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            newStatus.topAnchor.constraint(equalTo: userStatus.bottomAnchor, constant: 4),
            newStatus.trailingAnchor.constraint(equalTo: trailingAnchor),
            newStatus.heightAnchor.constraint(equalToConstant: 40),

            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.topAnchor.constraint(equalTo: newStatus.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class doesn't support NSCoding.")
    }
    
    @objc func buttonPressed() {
        userStatus.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Status can not be changed"
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}



