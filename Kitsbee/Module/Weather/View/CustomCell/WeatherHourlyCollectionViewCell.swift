//
//  WeatherHourlyCollectionViewCell.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 17/06/2021.
//

import UIKit

class WeatherHourlyCollectionView: CustomCollectionView {
    override func setupViewModel(_ viewModel: BaseCollectionVM) {
        super.setupViewModel(viewModel)
        
    }
    override func setupView() {
        let customLayout = UICollectionViewFlowLayout()
        customLayout.scrollDirection = .horizontal
        customLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        customLayout.minimumLineSpacing = 4
        customLayout.minimumInteritemSpacing = 10
        customLayout.itemSize = CGSize(width: 80, height: self.frame.size.height)
        self.collectionViewLayout = customLayout
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    override func registerCell(){
        registerCollectionViewCell(cellListName: [WeatherHourlyCollectionViewCell.identifier])
    }
    
    override func cellIdentifier() -> String {
        return WeatherHourlyCollectionViewCell.identifier
    }
}


class WeatherHourlyCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var lbHour: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lbTemp: UILabel!
    
    override func setViewModel(_ rowViewModel: RowViewModel) {
        if let viewModel = rowViewModel as? WeatherHourViewModel{
            imgWeather.image = UIImage(named: viewModel.imgWeatherString)
            lbHour.text = String(format: "%i", viewModel.hour)
            lbTemp.text = String(format: "%.1f", viewModel.temp)
        }
    }
}

class WeatherHourViewModel: RowViewModel{
    let imgWeatherString: String
    let hour: Int
    let temp: Double
    
    init(imageWeatherString: String, hour: Int, temp: Double) {
        self.imgWeatherString = imageWeatherString
        self.hour = hour
        self.temp = temp
    }
}
