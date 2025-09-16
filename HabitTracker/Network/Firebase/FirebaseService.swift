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
       
       /// A method to register the user
       /// - Parameters:
       ///   - userRequest: The users information (email, password, username)
       ///   - completion: A completion with two values...
       ///   - Bool: wasRegistered - Determines if the user was registered and saved in the database correctly
       ///   - Error?: An optional error if firebase provides once
    public func registerUser(username: String, email: String, password: String, completion: @escaping (Bool, Error?)->Void) {
        
           Auth.auth().createUser(withEmail: email, password: password) { result, error in
               if let error = error {
                   completion(false, error)
                   return
               }
               
               guard let resultUser = result?.user else {
                   completion(false, nil)
                   return
               }
               let user = User(id: resultUser.uid, email: email, name: username, joined: Date().timeIntervalSince1970)
               
               self.database.collection("users")
                   .document(resultUser.uid)
                   .setData(user.asDictonary()) { error in
                       if let error = error {
                           completion(false, error)
                           return
                       }
                       
                       completion(true, nil)
                   }
           }
       }
       
       public func signIn(email: String, password: String, completion: @escaping (Error?)->Void) {
           Auth.auth().signIn(
               withEmail: email,
               password: password
           ) { result, error in
               if let error = error {
                   completion(error)
                   return
               } else {
                   completion(nil)
               }
           }
       }
       
       public func signOut(completion: @escaping (Error?)->Void) {
           do {
               try Auth.auth().signOut()
               completion(nil)
           } catch let error {
               completion(error)
           }
       }
       
       public func forgotPassword(with email: String, completion: @escaping (Error?) -> Void) {
           Auth.auth().sendPasswordReset(withEmail: email) { error in
               completion(error)
           }
       }
       
       public func fetchUser(completion: @escaping (User?, Error?) -> Void) {
           guard let userUID = Auth.auth().currentUser?.uid else { return }
           print(userUID)
           
       }
    
    
    
}

class Validator {
    
    static func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidUsername(for username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRegEx = "\\w{4,24}"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: username)
    }
    
    static func isPasswordValid(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
}
