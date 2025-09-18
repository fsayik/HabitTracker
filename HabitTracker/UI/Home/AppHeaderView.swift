//
//  AppHeaderView.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 18.09.2025.
//

import UIKit

class AppHeaderView: UIView {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let containerStackView = UIStackView()
    let logoutButton = UIButton()
    
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        setupView(title: title, subtitle: subtitle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView(title: "Daily Habits", subtitle: "Today")
    }
    
    private func setupView(title: String, subtitle: String) {
        // Setup gradient background
        let gradientLayer = UIColor.headerGradient
        layer.addSublayer(gradientLayer())
        
        // Setup stack view
        containerStackView.axis = .vertical
        containerStackView.alignment = .center
        containerStackView.spacing = AppSpacing.xs
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup title
        let titleStackView = UIStackView()
        titleStackView.axis = .horizontal
        titleStackView.alignment = .center
        titleStackView.spacing = AppSpacing.Component.headerElementSpacing
        
        
        let logo: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named:  "AppLogo")
            return imageView
        }()
        
        titleLabel.text = title
        
        
        titleStackView.addArrangedSubview(logo)
        titleStackView.addArrangedSubview(titleLabel)
        
        // Setup subtitle
        let subtitleStackView = UIStackView()
        subtitleStackView.axis = .horizontal
        subtitleStackView.alignment = .center
        subtitleStackView.spacing = AppSpacing.Component.headerElementSpacing
        
        let calendarEmoji = UILabel()
        calendarEmoji.text = "📅"
        calendarEmoji.font = UIFont.systemFont(ofSize: 16)
        
        subtitleLabel.text = subtitle
        
        subtitleStackView.addArrangedSubview(calendarEmoji)
        subtitleStackView.addArrangedSubview(subtitleLabel)
        
        containerStackView.addArrangedSubview(titleStackView)
        containerStackView.addArrangedSubview(subtitleStackView)
        
        addSubview(containerStackView)
        addSubview(logoutButton)
        logoutButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.forward"), for: .normal)
        logoutButton.tintColor = .primaryPurple
        logoutButton.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: AppSpacing.Component.headerPadding),
            containerStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -AppSpacing.Component.headerPadding),
            
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 30),
            logoutButton.widthAnchor.constraint(equalToConstant: 30),
            
            logo.heightAnchor.constraint(equalToConstant: 60),
            logo.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
    }
    
    func updateSubtitle(_ subtitle: String) {
        subtitleLabel.text = subtitle
    }

}
