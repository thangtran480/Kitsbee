//
//  LoginViewController.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

class LoginVC: BaseViewController {

    var viewModel : LoginVM?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("login")
        viewModel?.showWeather()
    }

}
