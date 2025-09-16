//
//  RegisterViewModel.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import Foundation

protocol RegisterVMProtokol {
    var view: RegisterVCProtokol? {get set}
    
    func viewDidLoad()
    func register(username: String, email: String, password: String)
}


final class RegisterViewModel {
    weak var view: RegisterVCProtokol?
    
}

extension RegisterViewModel: RegisterVMProtokol {
    
    func viewDidLoad() {
        view?.setupUI()
    }
    
    func register(username: String, email: String, password: String) {
        FirebaseService.shared.registerUser(username: username, email: email, password: password) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                view?.showAlert()
                return
            }
            
            if wasRegistered {
                view?.checkRegistered()
            } else {
                print("dont register")
            }
        }
    }
    
    
}
