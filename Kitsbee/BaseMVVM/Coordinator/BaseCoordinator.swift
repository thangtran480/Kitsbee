//
//  BaseCoordinator.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

class BaseCoordinator {
    var navigation: UINavigationController
    init() {
        navigation = BaseNavigationViewController(rootViewController: UIViewController())
    }
    init(_ navigationController: UINavigationController = BaseNavigationViewController()) {
        self.navigation = navigationController
    }
    
    func start() {
    }
    
    func coordinate(to coordinator: BaseCoordinator){
        coordinator.start()
    }
}
