//
//  LoginView.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import UIKit

class LoginView: UIView {

    // MARK: - UI Elements
        private let logoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "AppLogo")
            imageView.tintColor = .systemPurple
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        private let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome Back"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 22)
            label.textColor = UIColor.systemPink
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Sign in to continue tracking your daily habits"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .darkGray
            label.numberOfLines = 0
            return label
        }()
        
        let emailTextField: LoginRegisterTextField = {
            let textField = LoginRegisterTextField()
            textField.placeholder = "Email"
            return textField
        }()
        
        let passwordTextField: LoginRegisterTextField = {
            let textField = LoginRegisterTextField()
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            return textField
        }()
        
        let signInButton: PrimaryButton = {
            let button = PrimaryButton(type: .system)
            button.setTitle("Login", for: .normal)
            return button
        }()
    
        let registerButton: PrimaryButton = {
            let button = PrimaryButton(type: .system)
            button.setTitle("Register", for: .normal)
            button.backgroundColor = .headerPurple
            return button
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Setup
        private func setupUI() {
            
            let stack = UIStackView(arrangedSubviews: [logoImageView, welcomeLabel, subtitleLabel, emailTextField, passwordTextField, signInButton,registerButton])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.spacing = 16
            addSubview(stack)
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate([
                stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                stack.centerYAnchor.constraint(equalTo: centerYAnchor),
                stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
                stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
                
                logoImageView.heightAnchor.constraint(equalToConstant: 300),
                logoImageView.widthAnchor.constraint(equalToConstant: 300),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
                registerButton.heightAnchor.constraint(equalToConstant: 50),
                emailTextField.heightAnchor.constraint(equalToConstant: 50),
                passwordTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }

}
