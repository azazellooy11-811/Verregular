//
//  AppDelegate.swift
//  Verregular
//
//  Created by Азалия Халилова on 18.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window {
            let navigationController = UINavigationController()
            navigationController.viewControllers = [HomeViewController()]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        return true
    }
}

