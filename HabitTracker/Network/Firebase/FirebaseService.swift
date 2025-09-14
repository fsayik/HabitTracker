//
//  FirebaseManager.swift
//  HabitTracker
//
//  Created by Ferhat Şayık on 14.09.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class FirebaseService {
    
    static let shared = FirebaseService()
    let database = Firestore.firestore()
    
    private init() {}
    
    func login(email: String, password: String) {
        
    }
    
    func registerUser(email: String, password: String) {
        
    }
    
}
