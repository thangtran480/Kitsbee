//
//  BaseViewController.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 15/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.bindView()
        self.setUpView()
        self.makeSubcriptions()
    }
    func bindView() {
        
    }
    func makeSubcriptions() {

    }
    func setUpView(){
        
    }
    
    func subcribeCommon(_ viewModel: BaseViewModel){
        // show/hidden loading
        viewModel.isLoading.subscribeShort { (isLoading) in
            print(isLoading)
        }.disposed(by: disposeBag)
        
        // show notification success with message
        viewModel.showMessageSuccess.subscribeShort { (message) in
            print(message)
        }.disposed(by: disposeBag)
        
        // show notification error with message
        viewModel.showMessageError.subscribeShort { (message) in
            print(message)
        }.disposed(by: disposeBag)
        
        // show notification validate with message
        viewModel.showMessageValidate.subscribeShort { (message) in
            print(message)
        }.disposed(by: disposeBag)
    }
}
