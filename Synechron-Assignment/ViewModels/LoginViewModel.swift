//
//  LoginViewModel.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func areValidInputs() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable().startWith("")).map { username, password in
            return  username.validateEmail() && password.validatePassword()
        }.startWith(false)
    }
}
