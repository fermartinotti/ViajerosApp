//
//  ViajerosAppApp.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 11/03/2022.
//

import SwiftUI
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ViajerosAppApp: App {
    
    @UIApplicationDelegateAdaptor (AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
