//
//  WeatherCoordinator.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

class WeatherCoordinator: BaseCoordinator {
    override func start() {
        super.start()
        let vc = WeatherVC()
        navigation.pushViewController(vc, animated: true)
    }
}
extension WeatherCoordinator{
    
}
