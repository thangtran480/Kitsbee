//
//  BaseServiceRx.swift
//  Kitsbee
//
//  Created by VTS-ThangTV28 on 15/06/2021.
//

import Alamofire
import RxCocoa
import RxSwift

struct Header {
    static let ContentType = "Content-Type"
    static let Accept = "Accept"
    static let ApplicationJson = "application/json"
}

class BaseServiceRx {
    var timeout = 10 // 10 seconds
    var sessionManager: Session!
    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = TimeInterval(timeout)
        configuration.allowsCellularAccess = false

        self.sessionManager = Session(configuration: configuration)
    }
    
    func post<T>(type: T.Type, params: [String: Any], pathUrl: String) ->Observable<T> where T: Decodable{
        return Observable.create{ observer in
            self.sessionManager
                .request(pathUrl, method: .post, parameters: params)
                .responseData(completionHandler: { data in
                    if let statusCode = data.response?.statusCode{
                        switch statusCode {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let parseData = try decoder.decode(type, from: data.data!)
                                observer.onNext(parseData)
                            }
                            catch{
                                print(error)
                                observer.onError(ApiError(errorCode: 0, message: "Can't cast response to type"))
                            }
                        default:
                            break
                        }
                    }else{
                        observer.onError(ApiError(errorCode: 400, message: "Message"))
                    }
                })
            return Disposables.create()
        }
    }
    func get<T>(type: T.Type, params: [String: Any], pathUrl: String) ->Observable<T> where T: Decodable{
        return Observable.create{ observer in
            self.sessionManager
                .request(pathUrl, method: .get, parameters: params)
                .responseData { (data) in
                    guard let statusCode = data.response?.statusCode else{
                        observer.onError(ApiError(errorCode: 400, message: "Message"))
                        return
                    }
                    switch statusCode{
                    case 200:
                        
                        do{
                            let decoder = JSONDecoder()
                            let parseData = try decoder.decode(type, from: data.data!)
                            observer.onNext(parseData)
                        }catch{
                            print(error)
                            observer.onError(ApiError(errorCode: 0, message: "Can't cast response to type"))
                        }
                        
                        break
                    default:
                        
                        break
                    }
                }
            
            return Disposables.create()
        }
    }
}

class ApiError: Error{
    var errorCode: Int?
    var message: String?
    init(errorCode: Int, message: String){
        
    }
}
