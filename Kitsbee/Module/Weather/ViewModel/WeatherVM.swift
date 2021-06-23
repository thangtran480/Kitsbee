//
//  WeatherVM.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class WeatherVM: BaseCollectionVM {

    private let service: WeatherService
    private let coordinator: WeatherCoordinator
    
    var currentWeather: PublishRelay<WeatherDetail>
    var currentAir: PublishRelay<AirQualityData>
    
    init(weatherService: WeatherService, weatherCoordinator: WeatherCoordinator) {
        self.service = weatherService
        self.coordinator = weatherCoordinator
        self.currentWeather = PublishRelay<WeatherDetail>()
        self.currentAir = PublishRelay<AirQualityData>()
    }
    
    /**
        Get data Weather
     */
    func getWaether(){
        //show progress loading
        self.isLoading.accept(true)
        
        var params = [String: Any]()
        params["lat"] = "21.009135"
        params["lon"] = "105.82823831"
        params["appid"] = "1712b13f1818ed66da04d1a46db51822"
        params["exclude"] = "minutely,alert"
        params["units"] = "metric"
        
        //call api
        service.oneCallWeather(params: params)
            .subscribeShort { (response) in
                self.processDataWeather(response)
            } onError: { (error) in
                print(error)
            }.disposed(by: disposeBag)
    }
    
    /**
        Get data Air Quality
     */
    func getAirQuality(){
        //show progress loading
        self.isLoading.accept(true)
        
        var params = [String: Any]()
        params["lat"] = "21.009135"
        params["lon"] = "105.82823831"
        params["key"] = "51945530-df6a-4041-a2bc-4d86a28b84ce"
        
        // call api
        service.airQuality(params: params).subscribeShort { (response) in
            self.processDataAirQuality(response.data)
        } onError: { (error) in
            print(error)
        }.disposed(by: disposeBag)
    }
    
    private func processDataWeather(_ data: WeatherResponse){
        //hidden progress loading
        self.isLoading.accept(false)
        
        processDataWeatherHourly(data.hourly)
        processDataWeatherCurrent(data.current)
    }
    private func processDataWeatherHourly(_ hourlys: [WeatherDetail], limited: Int = 24){
        for index in 1...limited{
            let hourly = hourlys[index]
            let hour = Date.hourFrome1970(hourly.dt)
            var nameImage = hourly.weather[0].nameImage
            if ((hour >= 18 && hour <= 23) || (hour >= 0 && hour <= 6)){
                nameImage = nameImage.replacingOccurrences(of: "d", with: "n")
            }
            let row = WeatherHourViewModel(imageWeatherString: nameImage, hour: hour, temp: hourly.temp)
            addRow(row: row)
        }
    }
    private func processDataWeatherCurrent(_ current : WeatherDetail){
        currentWeather.accept(current)
    }
    
    
    private func processDataAirQuality(_ data: AirQualityData){
        self.isLoading.accept(false)
        self.currentAir.accept(data)
    }
}
