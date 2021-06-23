//
//  CustomCollectionView.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class CustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    private var baseViewModel : BaseCollectionVM!
    private var indexPathDefault: IndexPath?
    private let disposeBag = DisposeBag()
    
    func setupViewModel(_ viewModel: BaseCollectionVM){
            
        self.baseViewModel = viewModel
        
        self.setupView()
        self.setupDelegate()
        self.bindViewModel()
        self.registerCell()
    }
    
    func registerCell() {
        
    }
    func setupView(){
        
    }
    func setupDelegate(){
        self.dataSource = self
        self.delegate = self
    }
    
    func bindViewModel(){
        self.baseViewModel.sectionViewModels.asDriver()
            .skip(1)
            .drive(onNext: { _ in
                self.reloadData()
            }).disposed(by: disposeBag)
    }
    func cellIdentifier() -> String{
        fatalError("Must Override method cellIdentifier")
    }
    
    
}
extension CustomCollectionView{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.baseViewModel.sectionViewModels?.value.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.baseViewModel.sectionViewModels?.value[section].rows.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionViewModel = self.baseViewModel.sectionViewModels!.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        let identifier = self.cellIdentifier()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let cell = cell as? BaseCollectionViewCell{
            cell.setViewModel(rowViewModel)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionViewModel = self.baseViewModel.sectionViewModels!.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        
        rowViewModel.didSelectedItem()
    }
}
