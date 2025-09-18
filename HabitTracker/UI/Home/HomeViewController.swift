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
    func headerView()
    func setupScrollView()
    func reloadCollectionView()
    func setupAddHabitButton()
}

final class HomeViewController: UIViewController, HomeVCProtokol{
    
    // MARK: - Variable
    
    private var mockHabits: [HabitFirebase] = [
        HabitFirebase(name: "Drink 8 glasses of water", streak: 5, target: 7, completed: false, category: "Health"),
        HabitFirebase(name: "Exercise for 30 minutes", streak: 12, target: 5, completed: true, category: "Fitness"),
        HabitFirebase(name: "Read for 20 minutes", streak: 8, target: 6, completed: false, category: "Learning"),
        HabitFirebase(name: "Meditate for 10 minutes", streak: 3, target: 6, completed: true, category: "Mindfulness"),
        
            HabitFirebase(name: "Drink 8 glasses of water", streak: 5, target: 7, completed: false, category: "Health"),
            HabitFirebase(name: "Exercise for 30 minutes", streak: 12, target: 5, completed: true, category: "Fitness"),
            HabitFirebase(name: "Read for 20 minutes", streak: 8, target: 6, completed: false, category: "Learning"),
            HabitFirebase(name: "Meditate for 10 minutes", streak: 3, target: 6, completed: true, category: "Mindfulness"),
        
            HabitFirebase(name: "Drink 8 glasses of water", streak: 5, target: 7, completed: false, category: "Health"),
            HabitFirebase(name: "Exercise for 30 minutes", streak: 12, target: 5, completed: true, category: "Fitness"),
            HabitFirebase(name: "Read for 20 minutes", streak: 8, target: 6, completed: false, category: "Learning"),
            HabitFirebase(name: "Meditate for 10 minutes", streak: 3, target: 6, completed: true, category: "Mindfulness"),
    ]
    
    private var viewModel = HomeViewModel()
    
    // MARK: - UI Components
    private let contentView = UIView()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = AppSpacing.Margin.section
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var topView: AppHeaderView!
    private var addHabitButton: AddButton!
    
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = AppSpacing.Margin.element
        flowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(HabitCell.self, forCellWithReuseIdentifier: HabitCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
        
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - UI Setup
  
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
            
        }
    }
    
    func setupUI() {
        view.backgroundColor = .backgroundGradientEnd
        
        NSLayoutConstraint.activate([
            // Header constraints
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 120),
            
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Content view constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            // Content stack view constraints
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppSpacing.Margin.section),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppSpacing.Margin.screen),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -AppSpacing.Margin.screen),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -AppSpacing.Margin.section),
            
            
            collectionView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: -50),
            
            addHabitButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func setupAddHabitButton() {
        addHabitButton = AddButton(title: "Add New Habit", icon: "✨")
        addHabitButton.translatesAutoresizingMaskIntoConstraints = false
        addHabitButton.addTarget(self, action: #selector(addHabit), for: .touchUpInside)
        contentStackView.addArrangedSubview(addHabitButton)
       
    }
    
    func setupScrollView() {
        
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(collectionView)
    
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func headerView() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        let dateString = formatter.string(from: Date())
        
        topView = AppHeaderView(title: "Daily Habits", subtitle: dateString)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topView)
        
        topView.logoutButton.addTarget(self, action: #selector(logut), for: .touchUpInside)
        
    }
    
    @objc func logut() {
        viewModel.singout()
    }
    @objc func addHabit() {
        viewModel.addHabit()
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
