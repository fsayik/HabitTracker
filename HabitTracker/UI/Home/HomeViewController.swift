//
//  HomeViewController.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let logoutButton: UIButton = {
        let buton = UIButton()
        buton.translatesAutoresizingMaskIntoConstraints = false
        buton.backgroundColor = .systemRed
        return buton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    private func setupUI() {
        view.addSubViews(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}
