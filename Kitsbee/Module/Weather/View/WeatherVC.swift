//
//  WeatherVC.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import CoreLocation

class WeatherVC: BaseViewController{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lbNameCity: UILabel!
    @IBOutlet weak var lbNameState: UILabel!
    @IBOutlet weak var tableWeatherHourly: WeatherHourlyCollectionView!
    @IBOutlet weak var ivWeather: UIImageView!
    @IBOutlet weak var lbWeatherTemp: UILabel!
    @IBOutlet weak var lbWeatherStatus: UILabel!
    @IBOutlet weak var viewImageAir: UIView!
    @IBOutlet weak var ivAir: UIImageView!
    @IBOutlet weak var lbAirNumber: UILabel!
    @IBOutlet weak var lbAirStatus: UILabel!
    @IBOutlet weak var lbLocationName: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    
    @IBOutlet weak var lbTimeSunset: UILabel!
    @IBOutlet weak var lbTimeSunrise: UILabel!
    @IBOutlet weak var lbRain: UILabel!
    @IBOutlet weak var lbWind: UILabel!
    @IBOutlet weak var lbFeelsLike: UILabel!
    @IBOutlet weak var lbPressure: UILabel!
    @IBOutlet weak var lbHumidity: UILabel!
    @IBOutlet weak var lbVisibility: UILabel!
    @IBOutlet weak var lbUvi: UILabel!
    
    var viewModel: WeatherVM!
    
    var locationManager: CLLocationManager?
    
    
    let refresher = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.refreshControl = refresher
        refresher.addTarget(self, action: #selector(startRefresh), for: .valueChanged)

        tableWeatherHourly.setupViewModel(viewModel)
        viewModel.getWaether()
        viewModel.getAirQuality()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
    }

    override func bindView() {
        
    }
    override func makeSubcriptions(){
        super.subcribeCommon(viewModel)
        
        self.viewModel.isLoading.subscribeShort{ (isLoading) in
            if (isLoading){
                print("loading")
            }else{
                print("stop loading")
            }
        }.disposed(by: disposeBag)
        
        self.viewModel.currentWeather.subscribeShort{ (weather) in
            self.lbWeatherTemp.text = String(format: "%.0f", weather.temp)
            self.lbWeatherStatus.text = weather.weather[0].description
            self.ivWeather.image = UIImage(named: weather.weather[0].nameImage)
            
            self.lbTimeSunrise.text = Date.hourSecondFrom1970(weather.sunrise ?? 0)
            self.lbTimeSunset.text = Date.hourSecondFrom1970(weather.sunset ?? 0)
            self.lbHumidity.text = "\(weather.humidity)"
            self.lbWind.text = "\(weather.wind_speed)"
            self.lbPressure.text = "\(weather.pressure)"
                                    
        }.disposed(by: disposeBag)
        
        self.viewModel.currentAir.subscribeShort { (airQuality) in
            self.lbAirNumber.text = String(format: "%i", airQuality.current.pollution.aqius)
            self.ivAir.image = UIImage(named: airQuality.current.pollution.nameImage)
            self.viewImageAir.backgroundColor = airQuality.current.pollution.color
            self.lbAirStatus.text = airQuality.current.pollution.status
            
            self.lbNameCity.text = airQuality.city
            self.lbNameState.text = "\(airQuality.state), \(airQuality.country)"
        }.disposed(by: disposeBag)
        
    }
    override func setUpView() {
        
    }
    
    @objc func startRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refresher.endRefreshing()
        }
    }
    
}

extension WeatherVC:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue = manager.location?.coordinate else {
            return
        }
        print("Location: \(locValue.latitude)")
        locationManager?.stopUpdatingLocation()
    }
}
