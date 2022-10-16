//
//  AppDelegate.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 16.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupWindow()
        
        return true
    }

    private func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
//        let viewModel = AuthViewModel()
        let viewController = AuthViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
}

