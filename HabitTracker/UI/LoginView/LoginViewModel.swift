//
//  LoginViewModel.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import Foundation

protocol LoginVMProtocol {
    var view: LoginVCProtocol? {set get}
    
    func viewDidLoad()
    func login(email: String, password: String)
}
final class LoginViewModel: LoginVMProtocol {
    weak var view: LoginVCProtocol?
    
    func viewDidLoad() {
        view?.setupUI()
    }
    
    func login(email: String, password: String) {
        FirebaseService.shared.signIn(email: email, password: password) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            view?.checkLogin()
        }
    }
}
