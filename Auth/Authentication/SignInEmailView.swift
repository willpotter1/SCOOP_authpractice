//
//  SignInEmailView.swift
//  Auth
//
//  Created by William Potter on 2025-07-01.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else{
            print("Invalid email/password")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
            } catch{
                print("Failed")
            }
        }
        
        
    }
    
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(.gray.opacity(0.4))
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(.gray.opacity(0.4))
            
            Button{
                viewModel.signIn()
            } label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .background(.blue)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                
            }
        }.navigationTitle("Sign In").padding()
    }
}

#Preview {
    SignInEmailView()
}
