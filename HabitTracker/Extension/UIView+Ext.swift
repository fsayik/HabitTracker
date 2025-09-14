//
//  UIView+Ext.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
    
    func applyCornerRadius(_ radius: CGFloat) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
    
}
