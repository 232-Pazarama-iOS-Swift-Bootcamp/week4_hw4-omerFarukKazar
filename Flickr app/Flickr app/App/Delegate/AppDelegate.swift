//
//  AppDelegate.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 16.10.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseRemoteConfig

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupWindow()
        setupFirebase()
        
        return true
    }
    
    private func setupFirebase() {
        FirebaseApp.configure()
        
        _ = Firestore.firestore()
    }

    private func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
//        let viewModel = AuthViewModel()
        let viewModel = AuthViewModel()
        let viewController = AuthViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
}

