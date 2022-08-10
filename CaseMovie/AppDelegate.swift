//
//  AppDelegate.swift
//  CaseMovie
//
//  Created by Winlentia on 10.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

