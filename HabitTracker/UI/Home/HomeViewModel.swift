//
//  HomeViewModel.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import Foundation

protocol HomeVMProtokol {
    var view: HomeVCProtokol? { get set }
    
    func viewDidLoad()
    func singout()
    
}

final class HomeViewModel: HomeVMProtokol{

    // MARK: - Variable
    weak var view: HomeVCProtokol?
    
    // MARK: - Functions
    func viewDidLoad() {
        view?.setupUI()
        view?.setupCollectionView()
    }
    
    func singout() {
        FirebaseService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            view?.checkLogout()
        }
    }
    
}
