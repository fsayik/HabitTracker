//
//  ViewController.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

protocol LoginVCProtocol: AnyObject {
    func setupUI()
    func checkLogin()
}

final class LoginViewController: UIViewController, LoginVCProtocol{
    
    // MARK: - Variable
    private var viewModel = LoginViewModel()
    
    // MARK: - UI Components
    private let loginView = LoginView()
   
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    
    // MARK: - UI Setup
    func setupUI() {
        view.backgroundColor = .backgroundGradientMiddle
        loginView.signInButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    
    @objc func didTapRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapLogin() {
        // Email check
        guard let email = loginView.emailTextField.text else {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        guard let password = loginView.passwordTextField.text else {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        viewModel.login(email: email, password: password)
    }
    
    func checkLogin() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.checkAuthentication()
        }
    }

    
}


