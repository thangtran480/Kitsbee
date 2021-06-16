//
//  WeatherVC.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

class WeatherVC: BaseViewController{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var weatherHourlyCollectionView: UICollectionView!
    
    
    let refresher = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.refreshControl = refresher
        refresher.addTarget(self, action: #selector(startRefresh), for: .valueChanged)
        // Do any additional setup after loading the view.
        print("show weather")
    }

    @objc func startRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refresher.endRefreshing()
        }
    }
}
