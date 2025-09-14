//
//  AppSpacing.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit

struct AppSpacing {
    // MARK: - Base Spacing Scale (4pt grid system)
    static let xs: CGFloat = 4      // 4pt
    static let sm: CGFloat = 8      // 8pt
    static let md: CGFloat = 12     // 12pt
    static let lg: CGFloat = 16     // 16pt
    static let xl: CGFloat = 20     // 20pt
    static let xxl: CGFloat = 24    // 24pt
    static let xxxl: CGFloat = 32   // 32pt
    
    // MARK: - Component Specific Spacing
    struct Component {
        // Card padding
        static let cardPadding: CGFloat = 20
        static let cardSpacing: CGFloat = 16
        
        // List spacing
        static let listItemSpacing: CGFloat = 12
        static let listSectionSpacing: CGFloat = 24
        
        // Button spacing
        static let buttonHeight: CGFloat = 48
        static let buttonPadding: CGFloat = 16
        static let buttonInternalSpacing: CGFloat = 8
        
        // Form spacing
        static let formFieldSpacing: CGFloat = 16
        static let formSectionSpacing: CGFloat = 24
        static let labelSpacing: CGFloat = 8
        
        // Header spacing
        static let headerPadding: CGFloat = 16
        static let headerVerticalPadding: CGFloat = 24
        static let headerElementSpacing: CGFloat = 8
        
        // Stats grid spacing
        static let statsGridSpacing: CGFloat = 12
        static let statsCardPadding: CGFloat = 16
        
        // Badge spacing
        static let badgePadding: CGFloat = 8
        static let badgeVerticalPadding: CGFloat = 4
        static let badgeSpacing: CGFloat = 16
        
        // Calendar spacing
        static let calendarCellSpacing: CGFloat = 4
        static let calendarHeaderSpacing: CGFloat = 12
    }
    
    // MARK: - Layout Margins
    struct Margin {
        static let screen: CGFloat = 16         // Main screen edges
        static let section: CGFloat = 24        // Between sections
        static let card: CGFloat = 20           // Card internal margins
        static let element: CGFloat = 12        // Between elements
        static let tight: CGFloat = 8           // Tight spacing
        static let loose: CGFloat = 32          // Loose spacing
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        static let pill: CGFloat = 999  // For pill-shaped elements
    }
    
    // MARK: - Shadow
    struct Shadow {
        static let radius: CGFloat = 4
        static let offset = CGSize(width: 0, height: 2)
        static let opacity: Float = 0.1
        static let color = UIColor.Card.shadow
    }
    
    
}

