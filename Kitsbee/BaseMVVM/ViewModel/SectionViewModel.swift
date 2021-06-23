//
//  SectionViewModel.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit
import RxSwift
import RxCocoa


class SectionViewModel {
    var rows: [RowViewModel] = [RowViewModel]()
    var headerTitle: String?
    var footerTitle: String?
    var sectionKey: Int
    
    init(rows: [RowViewModel], headerTitle: String? = nil, footerTitle: String? = nil, sectionKey : Int = 0) {
        self.rows = rows
        self.headerTitle = headerTitle
        self.footerTitle = headerTitle
        self.sectionKey = sectionKey
    }
}


class RowViewModel {
    func didSelectedItem(){
        
    }
}
