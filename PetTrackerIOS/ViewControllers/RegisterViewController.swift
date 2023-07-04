//
//  RegisterViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let emailTextField = CustomTextField(placeholder: "Email", isSecure: false)
    let phoneTextField = CustomTextField(placeholder: "Phone", isSecure: false)
    let passwordTextField = CustomTextField(placeholder: "Password",leftIcon: UIImage(named:"passkeyIcon")!,isSecure: true)
    let passwordCheckTextField = CustomTextField(placeholder: "Password Repeat",leftIcon: UIImage(named:"passkeyIcon")!,isSecure: true)
    let birthDateTextField = CustomTextField(placeholder: "Birth Date", isSecure: false)
    let registerButton = CustomButton(caption: "Register")

    override func viewDidLoad() {
        super.viewDidLoad()

        initViewObjects()
        initActions()
    }
    
    func initViewObjects(){
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(phoneTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(passwordCheckTextField)
        containerView.addSubview(birthDateTextField)
        containerView.addSubview(registerButton)
    }
    
    func initActions(){
        
    }

}

extension RegisterViewController {
    
    @objc func register(){
        
    }
    
}
