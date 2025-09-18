//
//  HabitCell.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import UIKit

class HabitCell: UICollectionViewCell {
    static let identifier = "HabitCell"
    
    // Checkbox
    let checkBox: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "square"), for: .normal)
        btn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        btn.tintColor = .black
        return btn
    }()
    
    // Title Label
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lbl.textColor = .black
        return lbl
    }()
    
    // Category Label
    private var categoryLabel = CategoryLabel(category: .Fitness)
    
    // Fire Count
    private let fireView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.systemGray6
        v.layer.cornerRadius = 8
        return v
    }()
    private let fireLabel = UILabel()
    
    // Like Count
    private let likeView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.systemGray6
        v.layer.cornerRadius = 8
        return v
    }()
    private let likeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = AppSpacing.CornerRadius.medium
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with habit: HabitFirebase) {
        titleLabel.text = habit.name
        let c: Category = {
            switch habit.category {
            case "Health":
                return .Health
            case "Fitness":
                return .Fitness
            case "Learning":
                return .Learning
            case "Mindfulness":
                return .Mindfulness
            case "Productivity":
                return .Productivity
            case "Social":
                return .Social
            default:
                return .Learning
            }
        }()
        categoryLabel.update(category: c)
        fireLabel.text = "🔥 \(habit.streak)"
        likeLabel.text = "🎯 \(habit.target)"
        checkBox.isSelected = habit.completed
        
        if habit.completed {
            titleLabel.attributedText = NSAttributedString(
                string: habit.name,
                attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            )
        } else {
            titleLabel.attributedText = nil
            titleLabel.text = habit.name
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        categoryLabel.text = ""
        fireLabel.text = ""
        likeLabel.text = ""
        checkBox.isSelected = false
    }
    
    private func setupUI() {
        fireLabel.font = UIFont.systemFont(ofSize: 12)
        likeLabel.font = UIFont.systemFont(ofSize: 12)
        
        fireView.addSubview(fireLabel)
        likeView.addSubview(likeLabel)
        fireLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fireLabel.centerXAnchor.constraint(equalTo: fireView.centerXAnchor),
            fireLabel.centerYAnchor.constraint(equalTo: fireView.centerYAnchor),
            likeLabel.centerXAnchor.constraint(equalTo: likeView.centerXAnchor),
            likeLabel.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            fireView.widthAnchor.constraint(equalToConstant: 50),
            fireView.heightAnchor.constraint(equalToConstant: 24),
            likeView.widthAnchor.constraint(equalToConstant: 50),
            likeView.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        let infoStack = UIStackView(arrangedSubviews: [titleLabel, categoryLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 4
        infoStack.alignment = .leading
        
        let rightStack = UIStackView(arrangedSubviews: [fireView, likeView])
        rightStack.axis = .horizontal
        rightStack.spacing = 8
        
        let mainStack = UIStackView(arrangedSubviews: [checkBox, infoStack, rightStack])
        mainStack.axis = .horizontal
        mainStack.alignment = .center
        mainStack.spacing = 12
        mainStack.distribution = .fill
        
        contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
}
