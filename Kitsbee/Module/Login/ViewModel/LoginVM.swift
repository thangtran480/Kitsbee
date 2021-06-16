//
//  LoginVM.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVM: BaseViewModel {
    var service: LoginService?
    var coordinator: LoginCoordinator?
    
    init(loginService: LoginService, loginCoordinator: LoginCoordinator) {
        super.init()
        self.service = loginService
        self.coordinator = loginCoordinator
    }
    
    func showWeather(){
        self.coordinator?.showWeatherVC()
    }
}
