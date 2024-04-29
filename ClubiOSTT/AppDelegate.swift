//
//  AppDelegate.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/8/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let initialViewController = TLStoryboard.Welcome.getViewController()

        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()

        return true
    }
}

