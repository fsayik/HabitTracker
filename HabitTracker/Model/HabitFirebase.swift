//
//  HabitFirebase.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 16.09.2025.
//

import Foundation
import FirebaseFirestore

// MARK: - Completion History Record
struct CompletionRecord: Identifiable, Codable {
    @DocumentID var id: String? // recordID
    var date: String // YYYY-MM-DD
    var completed: Bool
    var timestamp: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case completed
        case timestamp
    }
}

// MARK: - Habit Model
struct HabitFirebase: Identifiable, Codable {
    @DocumentID var id: String? // habitID
    var name: String
    var streak: Int
    var target: Int
    var completed: Bool
    var category: String
    var createdAt: Date?
    var lastUpdated: Date?
    
    // Firestore’da subcollection "completionHistory"
    var completionHistory: [CompletionRecord]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case streak
        case target
        case completed
        case category
        case createdAt
        case lastUpdated
        case completionHistory
    }
}
