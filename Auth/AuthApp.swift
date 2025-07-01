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
            NavigationStack{
                AuthenticationView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" {
          FirebaseApp.configure()
          print("Configed")
      }
      
    return true
  }
}

