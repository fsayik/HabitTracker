//
//  HomeViewController.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

protocol HomeVCProtokol: AnyObject {
    func setupUI()
    func checkLogout()
    func setupCollectionView()
}

final class HomeViewController: UIViewController, HomeVCProtokol{
    // MARK: - Variable
    private var viewModel = HomeViewModel()
    
    private var mockHabits: [Habit] = [
        Habit(title: "Drink 8 glasses of water", category: "Health", categoryColor: .systemGreen, fireCount: 5, likeCount: 7, isCompleted: false),
        Habit(title: "Exercise for 30 minutes", category: "Fitness", categoryColor: .systemOrange, fireCount: 12, likeCount: 5, isCompleted: true),
        Habit(title: "Read for 20 minutes", category: "Learning", categoryColor: .systemBlue, fireCount: 8, likeCount: 6, isCompleted: false),
        Habit(title: "Meditate for 10 minutes", category: "Mindfulness", categoryColor: .systemPurple, fireCount: 3, likeCount: 6, isCompleted: true)
    ]
    
    // MARK: - UI Components
    private let logoutButton: UIButton = {
        let buton = UIButton()
        buton.translatesAutoresizingMaskIntoConstraints = false
        buton.backgroundColor = .systemRed
        return buton
    }()
    private var collectionView: UICollectionView!
        
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
    
    // MARK: - UI Setup
  
    func setupUI() {
        view.addSubViews(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logut), for: .touchDown)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(HabitCell.self, forCellWithReuseIdentifier: HabitCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func logut() {
        viewModel.singout()
    }
    func checkLogout() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.checkAuthentication()
        }
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockHabits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCell.identifier, for: indexPath) as! HabitCell
        cell.configure(with: mockHabits[indexPath.item])
        return cell
    }
    
    // MARK: - Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //logut()
    }
    
}
