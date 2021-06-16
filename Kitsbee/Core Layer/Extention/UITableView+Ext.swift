//
//  UITableView+Ext.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit

extension UITableView{
    func registerTabelViewCell(cellListName: [String]){
        for cellName in cellListName{
            self.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
    }
}

extension UICollectionView{
    func registerCollectionViewCell(cellListName : [String]) {
        for cellName in cellListName{
            self.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        }
    }
}
