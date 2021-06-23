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
        let vm = WeatherVM(weatherService: WeatherService(), weatherCoordinator: self)
        vc.viewModel = vm
        navigation.pushViewController(vc, animated: true)
    }
}
extension WeatherCoordinator{
    
}
