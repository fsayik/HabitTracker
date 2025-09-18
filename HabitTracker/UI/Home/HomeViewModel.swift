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
    func addHabit()
    
}

final class HomeViewModel: HomeVMProtokol{
   
    

    // MARK: - Variable
    weak var view: HomeVCProtokol?
    
    // MARK: - Functions
    func viewDidLoad() {
        view?.setupScrollView()
        view?.headerView()
        view?.setupCollectionView()
        view?.setupAddHabitButton()
        view?.setupUI()
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
    
    func addHabit() {
        print("adddd")
    }
    
}
