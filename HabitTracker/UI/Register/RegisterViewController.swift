//
//  RegisterViewController.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    // MARK: - Variable
    
    // MARK: - UI Components
    // Email or username input field
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.applyCornerRadius(AppSpacing.CornerRadius.medium)
        return textField
    }()
    
    // Password input field
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.applyCornerRadius(AppSpacing.CornerRadius.medium)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // Login button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .primaryPurple
        button.tintColor = .white
        button.applyCornerRadius(AppSpacing.CornerRadius.medium)
        return button
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupUI()
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .backgroundGradientMiddle
        
        // Add subviews
        view.addSubViews(emailTextField, passwordTextField, loginButton)
        
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
