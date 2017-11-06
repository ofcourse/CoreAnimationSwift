//
//  LoginViewController.swift
//  CoreAnimationSwift
//
//  Created by hsg on 2017/11/6.
//  Copyright © 2017年 com.zhiding8. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var enableLabel: UILabel!
    
    var loginViewModel:LoginViewModel = LoginViewModel()
    let disposeBag:DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       _ = userNameTextField.rx.text.orEmpty.bind(to:loginViewModel.userName)
       _ = paswordTextField.rx.text.orEmpty.bind(to: loginViewModel.password)
        // Do any additional setup after loading the view.
      _ = loginViewModel.isValid
        //.map{$0}
        .bind(to: loginButton.rx.isEnabled)
    
        loginViewModel.isValid.subscribe(onNext: { (enabled) in
            self.enableLabel.text = enabled ? "enabled" : "unabled"
        }).disposed(by: disposeBag)
    }

}
