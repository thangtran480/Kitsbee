//
//  WeatherResponse.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import Foundation

struct WeatherResponse : Decodable{
    let current: WeatherDetail
    let hourly: [WeatherDetail]
//    let daily: [WeatherDetail]
}

struct WeatherDetail : Decodable{
    let dt: Int
    let sunrise: Int?
    let sunset: Int?
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [Weather]
}
struct Weather: Decodable{
    let id : Int
    let main: String
    let description: String
    let icon: String
    var nameImage: String{
        switch id {
        case 200...232:
            return "11d"
        case 300...321, 520...531:
            return "09d"
        case 500...504:
            return "10d"
        case 511, 600...622:
            return "13d"
        case 701...781:
            return "50d"
        case 800:
            return "01d"
        case 801:
            return "02d"
        case 802:
            return "03d"
        case 803, 804:
            return "04d"
        default:
            return "01d"
        }
    }
}

