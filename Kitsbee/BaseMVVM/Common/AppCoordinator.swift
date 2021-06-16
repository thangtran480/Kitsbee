//
//  AppCoordinator.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    var window: UIWindow?
    init(window: UIWindow?) {
        self.window = window
        super.init()
    }
    
    override func start(){
        startLogin()
    }
    
    private func startLogin(){
        let loginCoordinator = LoginCoordinator(self.navigation)
        coordinate(to: loginCoordinator)
        window?.rootViewController = loginCoordinator.navigation
        window?.makeKeyAndVisible()
    }
    
    private func startMain(){
        
    }
}
