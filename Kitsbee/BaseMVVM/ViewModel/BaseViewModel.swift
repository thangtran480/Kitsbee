//
//  BaseViewModel.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 16/06/2021.
//

import UIKit
import RxSwift
import RxCocoa


class BaseViewModel {
    var isLoading: PublishRelay<Bool>
    
    var showMessageError: PublishRelay<String>
    var showMessageSuccess: PublishRelay<String>
    var showMessageValidate: PublishRelay<String>
    
    var disposeBag: DisposeBag
    
    init() {
        isLoading = PublishRelay<Bool>()
        showMessageError = PublishRelay<String>()
        showMessageSuccess = PublishRelay<String>()
        showMessageValidate = PublishRelay<String>()
        disposeBag = DisposeBag()
        
    }
    
}
