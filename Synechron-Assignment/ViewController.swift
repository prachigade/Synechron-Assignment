//
//  ViewController.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 12/07/23.
//

import UIKit
import RxSwift
import RxCocoa 

class ViewController: UIViewController {

    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxtField.becomeFirstResponder()
        
        emailTxtField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        passwordTxtField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        
        loginViewModel.areValidInputs().bind(to: loginBtn.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.areValidInputs().map { $0 ? 1: 0.5 }.bind(to: loginBtn.rx.alpha).disposed(by: disposeBag)
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        print("login tapped")
    }
}

