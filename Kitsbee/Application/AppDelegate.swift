//
//  AppDelegate.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 03/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator : AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GlobalData.shared.window = window
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }

}
