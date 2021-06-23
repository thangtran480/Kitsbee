//
//  BaseCollectionVM.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 17/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class BaseCollectionVM: BaseViewModel{
    var sectionViewModels: BehaviorRelay<[SectionViewModel]>!
    var listViewModels: [SectionViewModel]!
    
    override init() {
        super.init()
        listViewModels = []
        self.sectionViewModels = BehaviorRelay.init(value: listViewModels)
    }
    
    func addRow(row: RowViewModel, headerTitle: String? = nil, footerTitle: String? = nil, sectionKey: Int = 0){
        let sectionModel = listViewModels.first{ (item) -> Bool in
            return item.sectionKey == sectionKey
        }
        if (sectionModel != nil){
            sectionModel?.rows.append(row)
        }else{
            listViewModels.append(SectionViewModel(rows: [row], headerTitle: headerTitle, footerTitle: footerTitle, sectionKey: sectionKey))
        }
        self.updateView()
    }
    func addRows(rows: [RowViewModel]) {
        for row in rows{
            addRow(row: row)
        }
    }
    
    func updateView(){
        sectionViewModels?.accept(listViewModels)
        
    }
}
