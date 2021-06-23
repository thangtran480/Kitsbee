//
//  Rx+Ext.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 22/06/2021.
//

import RxSwift
import RxCocoa

extension BehaviorRelay{
    public func subscribeShort(onNext: ((Element) -> Void)? , onError: ((Error) -> Void)? = nil) -> Disposable{
        return asObservable().subscribeShort(onNext: onNext, onError: onError)
    }
}

extension PublishRelay{
    public func subscribeShort(onNext: ((Element) -> Void)? , onError: ((Error) -> Void)? = nil) -> Disposable{
        return asObservable().subscribeShort(onNext: onNext, onError: onError)
    }
}

extension Observable{
    public func subscribeShort(onNext: ((Element) -> Void)? , onError: ((Error) -> Void)? = nil) -> Disposable{
        return self.observe(on: MainScheduler.instance).subscribe(onNext: onNext, onError: onError, onCompleted: nil, onDisposed: nil)
    }
}
