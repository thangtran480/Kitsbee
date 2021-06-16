//
//  GlobalData.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

class GlobalData {
    static let shared = GlobalData()
    
    private init(){
    }
    
    var window: UIWindow?
    
    func setRootView(_ rootViewController: UIViewController) {
        window?.rootViewController = rootViewController
    }
}
