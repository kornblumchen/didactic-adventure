//
//  ProfileHeaderView.swift
//  Navigation Task 1.3
//
//  Created by Vasilisa on 21.04.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    var avatarView: UIImageView!
    var userTextInfo: UIView!
    var userName: UILabel!
    var userStatus: UILabel!
    var button: UIButton!
    var newStatus: UITextField!
    private var statusText: String = " "
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        avatarView = UIImageView(frame: CGRect(x: 0, y: 16, width: 110, height: 110))
        avatarView.backgroundColor = .white
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3.0
        avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
        avatarView.clipsToBounds = true
        self.addSubview(avatarView)
        
        userTextInfo = UIView()
        self.addSubview(userTextInfo)
        
        userName = UILabel()
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18.0)
        userName.text = "Default user name"
        userTextInfo.addSubview(userName)
        
        userStatus = UILabel()
        userStatus.textColor = .gray
        userStatus.font = UIFont.systemFont(ofSize: 14.0)
        userStatus.text = "Default user status"
        userTextInfo.addSubview(userStatus)
        
        button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.addSubview(button)
        
        newStatus = UITextField()
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 12
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.layer.borderWidth = 1.0
        newStatus.textColor = .black
        newStatus.font = UIFont.systemFont(ofSize: 15.0)
        newStatus.setLeftPaddingPoints(10)
        newStatus.setRightPaddingPoints(10)
        newStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        userTextInfo.addSubview(newStatus)
        
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
