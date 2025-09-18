//
//  AddButton.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 18.09.2025.
//

import UIKit

class AddButton: UIButton {
    
    private let gradientLayer = CAGradientLayer()
    private var originalTransform: CGAffineTransform = .identity
    
    init(title: String, icon: String? = nil) {
        super.init(frame: .zero)
        setupButton(title: title, icon: icon)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton(title: "Button", icon: nil)
    }
    
    
    
    private func setupButton(title: String, icon: String?) {
        // Setup gradient background
        gradientLayer.colors = [UIColor.Button.primaryStart.cgColor, UIColor.Button.primaryEnd.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        layer.insertSublayer(gradientLayer, at: 0)
        
        // Setup title and icon
        var buttonTitle = title
        if let icon = icon {
            buttonTitle = "\(icon) \(title)"
        }
        
        setTitle(buttonTitle, for: .normal)
        
        // Setup constraints
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: AppSpacing.Component.buttonHeight).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}

