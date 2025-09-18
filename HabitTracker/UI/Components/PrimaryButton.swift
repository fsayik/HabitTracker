//
//  PrimaryButton.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import UIKit

class PrimaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setGradient()
    }
    
    private func setupUI() {
        backgroundColor = UIColor.primaryPurple
        layer.cornerRadius = AppSpacing.CornerRadius.medium
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .white
    }
    
    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.Button.primaryStart.cgColor, UIColor.Button.primaryEnd.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}


