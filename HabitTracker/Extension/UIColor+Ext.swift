//
//  UIColor+Ext.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import UIKit


extension UIColor {
    // MARK: - Primary Brand Colors
    static let primaryPurple = UIColor(red: 0.627, green: 0.125, blue: 0.941, alpha: 1.0) // #a020f0
    static let primaryPink = UIColor(red: 0.918, green: 0.114, blue: 0.549, alpha: 1.0) // #ea1d8c
    
    // MARK: - Background Gradients
    static let backgroundGradientStart = UIColor(red: 0.980, green: 0.949, blue: 1.0, alpha: 1.0) // purple-50
    static let backgroundGradientMiddle = UIColor(red: 0.984, green: 0.945, blue: 0.984, alpha: 1.0) // pink-50
    static let backgroundGradientEnd = UIColor(red: 0.937, green: 0.953, blue: 1.0, alpha: 1.0) // blue-50
    
    // MARK: - Header Background
    static let headerPurple = UIColor(red: 0.627, green: 0.125, blue: 0.941, alpha: 0.1)
    static let headerPink = UIColor(red: 0.918, green: 0.114, blue: 0.549, alpha: 0.1)
    static let headerBlue = UIColor(red: 0.219, green: 0.329, blue: 0.922, alpha: 0.1)
    
    // MARK: - Category Colors
    struct Category {
        // Health - Green
        static let healthBackground = UIColor(red: 0.937, green: 0.976, blue: 0.941, alpha: 1.0) // green-100
        static let healthText = UIColor(red: 0.133, green: 0.545, blue: 0.133, alpha: 1.0) // green-700
        static let healthBorder = UIColor(red: 0.733, green: 0.925, blue: 0.733, alpha: 1.0) // green-200
        
        // Fitness - Orange
        static let fitnessBackground = UIColor(red: 1.0, green: 0.925, blue: 0.871, alpha: 1.0) // orange-100
        static let fitnessText = UIColor(red: 0.761, green: 0.345, blue: 0.067, alpha: 1.0) // orange-700
        static let fitnessBorder = UIColor(red: 0.992, green: 0.835, blue: 0.714, alpha: 1.0) // orange-200
        
        // Learning - Blue
        static let learningBackground = UIColor(red: 0.875, green: 0.945, blue: 1.0, alpha: 1.0) // blue-100
        static let learningText = UIColor(red: 0.067, green: 0.329, blue: 0.729, alpha: 1.0) // blue-700
        static let learningBorder = UIColor(red: 0.733, green: 0.871, blue: 0.984, alpha: 1.0) // blue-200
        
        // Mindfulness - Purple
        static let mindfulnessBackground = UIColor(red: 0.953, green: 0.925, blue: 1.0, alpha: 1.0) // purple-100
        static let mindfulnessText = UIColor(red: 0.463, green: 0.224, blue: 0.675, alpha: 1.0) // purple-700
        static let mindfulnessBorder = UIColor(red: 0.851, green: 0.792, blue: 0.949, alpha: 1.0) // purple-200
        
        // Productivity - Yellow
        static let productivityBackground = UIColor(red: 1.0, green: 0.973, blue: 0.886, alpha: 1.0) // yellow-100
        static let productivityText = UIColor(red: 0.713, green: 0.525, blue: 0.043, alpha: 1.0) // yellow-700
        static let productivityBorder = UIColor(red: 0.992, green: 0.925, blue: 0.714, alpha: 1.0) // yellow-200
        
        // Social - Pink
        static let socialBackground = UIColor(red: 0.988, green: 0.925, blue: 0.976, alpha: 1.0) // pink-100
        static let socialText = UIColor(red: 0.745, green: 0.176, blue: 0.522, alpha: 1.0) // pink-700
        static let socialBorder = UIColor(red: 0.976, green: 0.827, blue: 0.949, alpha: 1.0) // pink-200
    }
    
    // MARK: - Status Colors
    struct Status {
        // Completed - Green
        static let completedBackground = UIColor(red: 0.937, green: 0.976, blue: 0.941, alpha: 1.0) // green-50
        static let completedBackgroundGradient = UIColor(red: 0.816, green: 0.953, blue: 0.831, alpha: 1.0) // emerald-50
        static let completedPrimary = UIColor(red: 0.133, green: 0.545, blue: 0.133, alpha: 1.0) // green-600
        static let completedBorder = UIColor(red: 0.733, green: 0.925, blue: 0.733, alpha: 0.5) // green-200/50
        
        // Streak - Orange/Red
        static let streakBackground = UIColor(red: 1.0, green: 0.925, blue: 0.871, alpha: 1.0) // orange-100
        static let streakBackgroundGradient = UIColor(red: 0.992, green: 0.906, blue: 0.906, alpha: 1.0) // red-100
        static let streakText = UIColor(red: 0.761, green: 0.345, blue: 0.067, alpha: 1.0) // orange-600
        
        // Missed - Red
        static let missedBackground = UIColor(red: 0.992, green: 0.906, blue: 0.906, alpha: 1.0) // red-100
        static let missedText = UIColor(red: 0.729, green: 0.161, blue: 0.161, alpha: 1.0) // red-600
        
        // Today - Purple
        static let todayBackground = UIColor(red: 0.627, green: 0.125, blue: 0.941, alpha: 1.0) // purple-500
        static let todayRing = UIColor(red: 0.804, green: 0.576, blue: 0.976, alpha: 1.0) // purple-300
    }
    
    // MARK: - Stats Card Colors
    struct StatsCard {
        // Green gradient
        static let greenStart = UIColor(red: 0.937, green: 0.976, blue: 0.941, alpha: 1.0) // green-100
        static let greenEnd = UIColor(red: 0.816, green: 0.953, blue: 0.831, alpha: 1.0) // emerald-100
        static let greenText = UIColor(red: 0.133, green: 0.545, blue: 0.133, alpha: 1.0) // green-600
        
        // Blue gradient
        static let blueStart = UIColor(red: 0.875, green: 0.945, blue: 1.0, alpha: 1.0) // blue-100
        static let blueEnd = UIColor(red: 0.839, green: 0.922, blue: 1.0, alpha: 1.0) // indigo-100
        static let blueText = UIColor(red: 0.067, green: 0.329, blue: 0.729, alpha: 1.0) // blue-600
        
        // Orange gradient
        static let orangeStart = UIColor(red: 1.0, green: 0.925, blue: 0.871, alpha: 1.0) // orange-100
        static let orangeEnd = UIColor(red: 0.992, green: 0.906, blue: 0.906, alpha: 1.0) // red-100
        static let orangeText = UIColor(red: 0.761, green: 0.345, blue: 0.067, alpha: 1.0) // orange-600
        
        // Purple gradient
        static let purpleStart = UIColor(red: 0.953, green: 0.925, blue: 1.0, alpha: 1.0) // purple-100
        static let purpleEnd = UIColor(red: 0.988, green: 0.925, blue: 0.976, alpha: 1.0) // pink-100
        static let purpleText = UIColor(red: 0.463, green: 0.224, blue: 0.675, alpha: 1.0) // purple-600
    }
    
    // MARK: - Progress Colors
    struct Progress {
        static let trackBackground = UIColor(red: 0.804, green: 0.576, blue: 0.976, alpha: 0.5) // purple-200/50
        static let fillStart = UIColor(red: 0.627, green: 0.125, blue: 0.941, alpha: 1.0) // purple-500
        static let fillEnd = UIColor(red: 0.918, green: 0.114, blue: 0.549, alpha: 1.0) // pink-500
    }
    
    // MARK: - Button Colors
    struct Button {
        static let primaryStart = UIColor(red: 0.627, green: 0.125, blue: 0.941, alpha: 1.0) // purple-500
        static let primaryEnd = UIColor(red: 0.918, green: 0.114, blue: 0.549, alpha: 1.0) // pink-500
        static let primaryHoverStart = UIColor(red: 0.553, green: 0.047, blue: 0.831, alpha: 1.0) // purple-600
        static let primaryHoverEnd = UIColor(red: 0.831, green: 0.067, blue: 0.475, alpha: 1.0) // pink-600
        
        static let secondaryBackground = UIColor.white.withAlphaComponent(0.5)
        static let secondaryHover = UIColor.white.withAlphaComponent(0.8)
        
        static let completedBackground = UIColor(red: 0.133, green: 0.545, blue: 0.133, alpha: 1.0) // green-500
        static let completedHover = UIColor(red: 0.047, green: 0.467, blue: 0.047, alpha: 1.0) // green-600
    }
    
    // MARK: - Text Colors
    struct Text {
        static let primary = UIColor(red: 0.075, green: 0.075, blue: 0.075, alpha: 1.0) // gray-800
        static let secondary = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1.0) // gray-600
        static let muted = UIColor(red: 0.553, green: 0.553, blue: 0.553, alpha: 1.0) // muted-foreground
        static let white = UIColor.white
    }
    
    // MARK: - Card Colors
    struct Card {
        static let background = UIColor.white
        static let shadow = UIColor.black.withAlphaComponent(0.1)
        static let border = UIColor.clear
    }
}
