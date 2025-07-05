//
//  AuthenticationManager.swift
//  Auth
//
//  Created by William Potter on 2025-07-01.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    private init() {}
    
    func createUser(email: String, password: String, ) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        do {
            try await authDataResult.user.sendEmailVerification()
            print("✅ Verification e-mail sent.")
        } catch {
            print("❌ Failed to send verification e-mail:", error.localizedDescription)
            // you can also surface this to the user via your infoMessage
            throw error  // or handle gracefully
        }
        
        return AuthDataResultModel(user: authDataResult.user)
    }
}
