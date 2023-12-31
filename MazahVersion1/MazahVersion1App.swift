//
//  MazahVersion1App.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 11/19/23.
//

import SwiftUI
import Firebase

@main
struct MazahVersion1App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    var body: some Scene {
        WindowGroup {
            FirstView()
            }
        }
    }



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
