//
//  LoginCoordinator.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    override func start() {
        super.start()
        let loginvc = LoginVC()
        loginvc.viewModel = LoginVM(loginService: LoginService(), loginCoordinator: self)
        navigation = UINavigationController(rootViewController: loginvc)
    }
}

extension LoginCoordinator{
    func showWeatherVC(){
        let weatherCoordinator = WeatherCoordinator(navigation)
        coordinate(to: weatherCoordinator)
    }
}
