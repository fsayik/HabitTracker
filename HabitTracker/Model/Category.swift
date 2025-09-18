//
//  Category.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import UIKit

protocol CategoryConfigure {
    var emoji: String {get}
    var text: String {get}
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
    var borderColor: UIColor {get}
}

enum Category {
    case Health
    case Fitness
    case Learning
    case Mindfulness
    case Productivity
    case Social
}

extension Category: CategoryConfigure {
    var emoji: String {
        switch self {
            
        case .Health:
            return "🏥"
        case .Fitness:
            return "💪"
        case .Learning:
            return "📚"
        case .Mindfulness:
            return "🧘"
        case .Productivity:
            return "⚡"
        case .Social:
            return "👥"
        }
    }
    
    var text: String {
        switch self {
            
        case .Health:
            return "Health"
        case .Fitness:
            return "Fitness"
        case .Learning:
            return "Learning"
        case .Mindfulness:
            return "Mindfulness"
        case .Productivity:
            return "Productivity"
        case .Social:
            return "Social"
        }
    }
    
    
    var backgroundColor: UIColor {
        switch self {
            
        case .Health:
            return .Category.healthBackground
        case .Fitness:
            return .Category.fitnessBackground
        case .Learning:
            return .Category.learningBackground
        case .Mindfulness:
            return .Category.mindfulnessBackground
        case .Productivity:
            return .Category.productivityBackground
        case .Social:
            return .Category.socialBackground
        }
    }
    
    
    var textColor: UIColor {
        switch self {
            
        case .Health:
            return .Category.healthText
        case .Fitness:
            return .Category.fitnessText
        case .Learning:
            return .Category.learningText
        case .Mindfulness:
            return .Category.mindfulnessText
        case .Productivity:
            return .Category.healthText
        case .Social:
            return .Category.healthText
        }
    }
    
    
    var borderColor: UIColor {
        switch self {
            
        case .Health:
            return .Category.healthBorder
        case .Fitness:
            return .Category.healthBorder
        case .Learning:
            return .Category.healthBorder
        case .Mindfulness:
            return .Category.healthBorder
        case .Productivity:
            return .Category.healthBorder
        case .Social:
            return .Category.healthBorder
        }
    }
    
    
    
    
}

