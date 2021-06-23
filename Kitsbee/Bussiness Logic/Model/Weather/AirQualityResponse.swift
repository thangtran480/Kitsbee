//
//  AirQualityResponse.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 21/06/2021.
//

import UIKit

class AirQualityResponse: Decodable {
    let status : String?
    let data: AirQualityData
}
class AirQualityData: Decodable{
    let current: AirQualityCurrent
    let city: String
    let state: String
    let country: String
}
class AirQualityCurrent: Decodable{
    let pollution: AirQualityPollution
}
class AirQualityPollution: Decodable {
    let ts: String
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let maincn: String
    var color: UIColor{
        switch aqius {
        case 0...50:
            return UIColor.green
        case 51...100:
            return UIColor.yellow
        case 101...150:
            return UIColor.orange
        case 151...200:
            return UIColor.red
        case 201...300:
            return UIColor.purple
        default:
            return UIColor.magenta
        }
    }
    var nameImage: String{
        switch aqius {
        case 0...50:
            return "ic-face-green"
        case 51...100:
            return "ic-face-yellow"
        case 101...150:
            return "ic-face-orange"
        case 151...200:
            return "ic-face-red"
        case 201...300:
            return "ic-face-purple"
        default:
            return "ic-face-maroon"
        }
    }
    var status: String{
        switch aqius {
        case 0...50:
            return "Good"
        case 51...100:
            return "Staisfactory"
        case 101...150:
            return "Moderater"
        case 151...200:
            return "Poor"
        case 201...300:
            return "Very Poor"
        default:
            return "Severe"
        }
    }
}
