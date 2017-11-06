//
//  LoginViewModel.swift
//  CoreAnimationSwift
//
//  Created by hsg on 2017/11/6.
//  Copyright © 2017年 . All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct LoginViewModel {
    
    var userName:Variable<String> = Variable("")
    var password:Variable<String> = Variable("")
    
    var isValid:Observable<Bool> {
        return Observable.combineLatest (userName.asObservable(), password.asObservable()) {
            uName,pwd in
            return (uName.characters.count > 3 && pwd.characters.count > 3)
        }
    }
}
