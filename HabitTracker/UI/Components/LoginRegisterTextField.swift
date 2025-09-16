//
//  LoginRegisterTextField.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import UIKit

class LoginRegisterTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor.systemGray6
        layer.cornerRadius = AppSpacing.CornerRadius.medium
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        // Add padding
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        leftViewMode = .always
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        rightViewMode = .always
        
    }
}
