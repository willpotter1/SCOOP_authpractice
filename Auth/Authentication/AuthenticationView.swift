//
//  AuthenticationView.swift
//  Auth
//
//  Created by William Potter on 2025-07-01.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink {
                    SignInEmailView()
                } label: {
                    Text("Sign in with email")
                        .background(Color.blue)
                        .colorInvert()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.black)
                }
                
            }.navigationTitle("Sign in")
        }
    }
}

#Preview {
    NavigationStack {AuthenticationView()}
}
