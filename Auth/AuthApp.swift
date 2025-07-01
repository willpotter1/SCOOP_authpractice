//
//  AuthApp.swift
//  Auth
//
//  Created by William Potter on 2025-06-30.
//

import SwiftUI
import Firebase
import UIKit


@main
struct AuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Configed")
    return true
  }
}

