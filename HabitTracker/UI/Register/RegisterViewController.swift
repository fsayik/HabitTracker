//
//  RegisterViewController.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

protocol RegisterVCProtokol: AnyObject {
    
    func setupUI()
    func checkRegistered()
    func showAlert() 
}

final class RegisterViewController: UIViewController, RegisterVCProtokol{
    
    // MARK: - Variable
    
    private var viewModel = RegisterViewModel()
    
    // MARK: - UI Components
    
    private let registerView = RegisterView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    func checkRegistered() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.checkAuthentication()
        }
    }
    @objc func register() {
        if registerView.passwordTextField.text == registerView.confirmPasswordTextField.text {
            viewModel.register(username: registerView.nameTextField.text ?? "",
                               email: registerView.emailTextField.text ?? "",
                               password: registerView.passwordTextField.text ?? "")
        }else {
            AlertManager.showInvalidPasswordAlert(on: self)
        }
        
    }
    
    func showAlert() {
        AlertManager.showInvalidEmailAlert(on: self)
    }
    
    
    // MARK: - UI Setup
    func setupUI() {
        view.backgroundColor = .backgroundGradientMiddle
        
        view.backgroundColor = .backgroundGradientMiddle
        registerView.signInButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        
        view.addSubview(registerView)
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.topAnchor),
            registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
        
}
