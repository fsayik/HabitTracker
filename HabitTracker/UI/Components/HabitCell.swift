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
        let categoryLabel: UILabel = {
            let lbl = UILabel()
            lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            lbl.textColor = .white
            lbl.textAlignment = .center
            lbl.layer.cornerRadius = 6
            lbl.layer.masksToBounds = true
            lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            return lbl
        }()
        
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
            contentView.backgroundColor = UIColor(red: 240/255, green: 250/255, blue: 245/255, alpha: 1)
            contentView.layer.cornerRadius = 12
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.systemGray4.cgColor
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with habit: Habit) {
            titleLabel.text = habit.title
            categoryLabel.text = " \(habit.category) "
            categoryLabel.backgroundColor = habit.categoryColor
            fireLabel.text = "🔥 \(habit.fireCount)"
            likeLabel.text = "👍 \(habit.likeCount)"
            checkBox.isSelected = habit.isCompleted
            
            if habit.isCompleted {
                titleLabel.attributedText = NSAttributedString(
                    string: habit.title,
                    attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
                )
            } else {
                titleLabel.attributedText = nil
                titleLabel.text = habit.title
            }
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
