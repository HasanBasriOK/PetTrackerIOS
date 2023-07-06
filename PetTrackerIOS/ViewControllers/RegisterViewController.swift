//
//  RegisterViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 4.07.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let emailTextField = CustomTextField(placeholder: "Email", isSecure: false)
    let nameTextField = CustomTextField(placeholder: "Name", isSecure: false)
    let phoneTextField = CustomTextField(placeholder: "Phone", isSecure: false)
    let passwordTextField = CustomTextField(placeholder: "Password",leftIcon: UIImage(named:"passkeyIcon")!,isSecure: true)
    let passwordCheckTextField = CustomTextField(placeholder: "Password Repeat",leftIcon: UIImage(named:"passkeyIcon")!,isSecure: true)
    let birthDateTextField = CustomTextField(placeholder: "Birth Date", isSecure: false)
    let registerButton = CustomButton(caption: "Register")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        initViewObjects()
        initActions()
    }
    
    func initViewObjects(){
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let rowSize = CGFloat(60)
        
        view.addSubview(containerView)
        containerView.addSubview(nameTextField)
        containerView.addSubview(emailTextField)
        containerView.addSubview(phoneTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(passwordCheckTextField)
        containerView.addSubview(birthDateTextField)
        containerView.addSubview(registerButton)
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
         
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: rowSize),
            phoneTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            phoneTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            phoneTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: rowSize),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            birthDateTextField.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: rowSize),
            birthDateTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            birthDateTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            birthDateTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: birthDateTextField.topAnchor, constant: rowSize),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            passwordCheckTextField.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: rowSize),
            passwordCheckTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordCheckTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            passwordCheckTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordCheckTextField.topAnchor, constant: rowSize),
            registerButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            registerButton.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            registerButton.heightAnchor.constraint(equalTo: nameTextField.heightAnchor)
        ])
        
    }
    
    func initActions(){
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
    }

}

extension RegisterViewController {
    
    @objc func register(){
        
        var enteredName = nameTextField.text ?? ""
        var enteredPhone = phoneTextField.text ?? ""
        var enteredEmail = emailTextField.text ?? ""
        var enteredPassword = passwordTextField.text ?? ""
        var enteredPasswordRepeat = passwordCheckTextField.text ?? ""
        var enteredBirthdate = birthDateTextField.text ?? ""
        
        if enteredName.isEmpty || enteredPhone.isEmpty || enteredEmail.isEmpty || enteredPassword.isEmpty || enteredPasswordRepeat.isEmpty || enteredBirthdate.isEmpty {
            
            AlertHelper.showBasicAlert(message: UserMessageConstants.registerValidationMessageForEmptyField , viewController: self)
            return
        }
    }
}
