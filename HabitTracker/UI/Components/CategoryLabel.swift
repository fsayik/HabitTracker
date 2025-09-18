//
//  CategoryLabel.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import UIKit

class CategoryLabel: UILabel {
    
    var category: Category
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(category: Category){
        self.category = category
        super.init(frame: .zero)
        configure()
    }
    
    
    private func configure() {
        text = "\(category.emoji) \(category.text)"
        backgroundColor = category.backgroundColor
        layer.cornerRadius = AppSpacing.CornerRadius.small
        layer.borderColor = category.borderColor.cgColor
        textColor = category.textColor
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 10, weight: .medium)
        layer.masksToBounds = true
    }
    
    func update(category: Category) {
        self.category = category
        configure()
    }
    
}
