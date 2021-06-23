//
//  WeatherService.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import RxSwift
import RxCocoa

class WeatherService {
    private let baseService: BaseServiceRx
    
    init() {
        baseService = BaseServiceRx()
    }
    func oneCallWeather(params: [String: Any]) -> Observable<WeatherResponse>{
             
        return baseService.get(type: WeatherResponse.self, params: params, pathUrl: "https://api.openweathermap.org/data/2.5/onecall")
    }
    
    func airQuality(params: [String: Any]) -> Observable<AirQualityResponse>{
        return baseService.get(type: AirQualityResponse.self, params: params, pathUrl: "https://api.airvisual.com/v2/nearest_city")
    }
}
