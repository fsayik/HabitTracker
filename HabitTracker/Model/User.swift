//
//  User.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
